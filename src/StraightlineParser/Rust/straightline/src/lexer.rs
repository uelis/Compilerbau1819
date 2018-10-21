//! Adapted version of LALRPOP lexer.
use std::str::CharIndices;
use unicode_xid::UnicodeXID;

use self::ErrorCode::*;
use self::Tok::*;

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Error {
    pub location: usize,
    pub code: ErrorCode,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub enum ErrorCode {
    UnrecognizedToken,
}

fn error<T>(c: ErrorCode, l: usize) -> Result<T, Error> {
    Err(Error {
            location: l,
            code: c,
        })
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub enum Tok<'input> {
    // Keywords:
    Print,

    // Symbols:
    Comma,
    Semicolon,
    LeftParen,
    RightParen,
    Plus,
    Minus,
    Star,
    Slash,
    Equals,

    // Identifiers and numbers:
    Id(&'input str),
    Num(i32),
}

pub struct Tokenizer<'input> {
    text: &'input str,
    chars: CharIndices<'input>,
    lookahead: Option<(usize, char)>,
    shift: usize,
}

pub type Spanned<T> = (usize, T, usize);

const KEYWORDS: &'static [(&'static str, Tok<'static>)] = &[("print", Print)];

impl<'input> Tokenizer<'input> {
    pub fn new(text: &'input str, shift: usize) -> Tokenizer<'input> {
        let mut t = Tokenizer {
            text: text,
            chars: text.char_indices(),
            lookahead: None,
            shift: shift,
        };
        t.bump();
        t
    }

    fn next_unshifted(&mut self) -> Option<Result<Spanned<Tok<'input>>, Error>> {
        loop {
            return match self.lookahead {
                Some((idx0, ',')) => {
                    self.bump();
                    Some(Ok((idx0, Comma, idx0 + 1)))
                }
                Some((idx0, ';')) => {
                    self.bump();
                    Some(Ok((idx0, Semicolon, idx0 + 1)))
                }
                Some((idx0, '(')) => {
                    self.bump();
                    Some(Ok((idx0, LeftParen, idx0 + 1)))
                }
                Some((idx0, ')')) => {
                    self.bump();
                    Some(Ok((idx0, RightParen, idx0 + 1)))
                }
                Some((idx0, '+')) => {
                    self.bump();
                    Some(Ok((idx0, Plus, idx0 + 1)))
                }
                Some((idx0, '-')) => {
                    self.bump();
                    Some(Ok((idx0, Minus, idx0 + 1)))
                }
                Some((idx0, '*')) => {
                    self.bump();
                    Some(Ok((idx0, Star, idx0 + 1)))
                }
                Some((idx0, '/')) => {
                    match self.bump() {
                        Some((_, '/')) => {
                            self.line_comment();
                            continue;
                        }
                        Some((_, '*')) => {
                            self.comment();
                            continue;
                        }
                        _ => Some(Ok((idx0, Slash, idx0 + 1))),
                    }
                }
                Some((idx0, '=')) => {
                    self.bump();
                    Some(Ok((idx0, Equals, idx0 + 1)))
                }
                Some((idx0, c)) if is_identifier_start(c) => Some(self.identifierish(idx0)),
                Some((idx0, c)) if c.is_numeric() => Some(self.number(idx0)),
                Some((_, c)) if c.is_whitespace() => {
                    self.bump();
                    continue;
                }
                Some((idx, _)) => Some(error(UnrecognizedToken, idx)),
                None => None,
            };
        }
    }

    fn bump(&mut self) -> Option<(usize, char)> {
        self.lookahead = self.chars.next();
        self.lookahead
    }

    fn identifierish(&mut self, idx0: usize) -> Result<Spanned<Tok<'input>>, Error> {
        let (start, word, end) = self.word(idx0);

        let tok = KEYWORDS
            .iter()
            .filter(|&&(w, _)| w == word)
            .map(|&(_, ref t)| t.clone())
            .next()
            .unwrap_or_else(|| Id(word));

        let st = (start, tok, end);
        Ok(st)
    }

    fn number(&mut self, idx0: usize) -> Result<Spanned<Tok<'input>>, Error> {
        let (start, word, end) = self.numeric(idx0);

        match word.parse::<i32>() {
            Ok(i) => Ok((start, Num(i), end)),
            Err(_) => {
                Err(Error {
                        location: start,
                        code: UnrecognizedToken,
                    })
            }
        }
    }

    fn numeric(&mut self, idx0: usize) -> Spanned<&'input str> {
        match self.take_while(|c| c.is_numeric()) {
            Some(end) => (idx0, &self.text[idx0..end], end),
            None => (idx0, &self.text[idx0..], self.text.len()),
        }
    }

    fn word(&mut self, idx0: usize) -> Spanned<&'input str> {
        match self.take_while(is_identifier_continue) {
            Some(end) => (idx0, &self.text[idx0..end], end),
            None => (idx0, &self.text[idx0..], self.text.len()),
        }
    }

    fn line_comment(&mut self) {
        self.take_until(|c| c == '\n');
        self.bump();
    }

    fn comment(&mut self) {
        loop {
            self.take_until(|c| c == '*');
            self.bump();
            match self.lookahead {
                None => return (),
                Some((_, '/')) => {
                    self.bump();
                    return ();
                }
                Some(_) => (),
            }
        }
    }

    fn take_while<F>(&mut self, mut keep_going: F) -> Option<usize>
        where F: FnMut(char) -> bool
    {
        self.take_until(|c| !keep_going(c))
    }

    fn take_until<F>(&mut self, mut terminate: F) -> Option<usize>
        where F: FnMut(char) -> bool
    {
        loop {
            match self.lookahead {
                None => {
                    return None;
                }
                Some((idx1, c)) => {
                    if terminate(c) {
                        return Some(idx1);
                    } else {
                        self.bump();
                    }
                }
            }
        }
    }
}

impl<'input> Iterator for Tokenizer<'input> {
    type Item = Result<Spanned<Tok<'input>>, Error>;

    fn next(&mut self) -> Option<Result<Spanned<Tok<'input>>, Error>> {
        match self.next_unshifted() {
            None => None,
            Some(Ok((l, t, r))) => Some(Ok((l + self.shift, t, r + self.shift))),
            Some(Err(Error { location, code })) => {
                Some(Err(Error {
                             location: location + self.shift,
                             code: code,
                         }))
            }
        }
    }
}

fn is_identifier_start(c: char) -> bool {
    UnicodeXID::is_xid_start(c)
}

fn is_identifier_continue(c: char) -> bool {
    UnicodeXID::is_xid_continue(c)
}

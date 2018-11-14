use std::cell::RefCell;
use std::collections::HashMap;
use std::fmt::{Display, Formatter, Error};

pub type Ident = Name;
pub type Label = Name;

#[derive(Copy, Clone, PartialEq, Eq, PartialOrd, Ord, Hash, Debug)]
pub enum Name {
    Interned(usize)
}

impl Name {
    /// Generates a fresh name.
    /// These name will be displayed as t0, t1, t2, ....
    pub fn new() -> Name {
        with_interner(|interner| {
            Name::Interned(interner.fresh_id())
        })
    }

    /// Interns the given string and returns a name for it.
    /// The returned name will be displayed as the given name.
    pub fn named(s: &str) -> Name {
        with_interner(|interner| {
            Name::Interned(interner.id_of_str(s))
        })
    }
}

impl Display for Name {
    fn fmt(&self, fmt: &mut Formatter) -> Result<(), Error> {
        match *self {
            Name::Interned(i) => with_interner(|interner| {
                match interner.str_of_id(i) {
                    None => write!(fmt, "t{}", i),
                    Some(s) => write!(fmt, "{}", s)
                }
            }),
        }
    }
}

#[derive(Debug)]
pub struct Interner {
    next_id: usize,
    ids: HashMap<String, usize>,
    names: HashMap<usize, String>,
}

impl<'a> Interner {
    pub fn new() -> Interner {
        Interner {
            next_id: 0,
            ids: HashMap::new(),
            names: HashMap::new(),
        }
    }

    pub fn fresh_id(&mut self) -> usize {
        let id = self.next_id;
        self.next_id = self.next_id + 1;
        id
    }

    pub fn id_of_str(&mut self, name: &str) -> usize {
        match self.ids.get(name).cloned() {
            Some(i) => i,
            None => {
                let i = self.fresh_id();
                self.ids.insert(name.to_string(), i);
                self.names.insert(i, name.to_string());
                i
            }
        }
    }
    pub fn str_of_id(&self, id: usize) -> Option<&String> {
        self.names.get(&id)
    }
}

// Each thread stores an interner.
thread_local!( static INTERNER: RefCell < Interner > = RefCell::new(Interner::new()));


fn with_interner<T, F: FnOnce(&mut Interner) -> T>(f: F) -> T {
    INTERNER.with(|interner| f(&mut *interner.borrow_mut()))
}

use std::collections::{HashMap, HashSet};
use std::fmt::{Display, Error, Formatter};
use std::hash::Hash;

#[derive(Debug)]
pub struct Graph<N>
where
    N: Hash + Eq + Copy,
{
    nodes: HashSet<N>,
    successors: HashMap<N, HashSet<N>>,
}

impl<N> Graph<N>
where
    N: Hash + Eq + Copy,
{
    pub fn new() -> Graph<N> {
        Graph {
            nodes: HashSet::default(),
            successors: HashMap::default(),
        }
    }

    pub fn add_node(&mut self, n: N) {
        let _ = self.nodes.insert(n);
    }

    pub fn add_edge(&mut self, from: N, to: N) {
        self.successors
            .entry(from)
            .or_insert_with(HashSet::default)
            .insert(to);
    }

    pub fn nodes(&self) -> &HashSet<N> {
        &self.nodes
    }

    pub fn get_successors(&mut self, n: N) -> &HashSet<N> {
        self.successors.entry(n).or_insert_with(HashSet::default)
    }

    pub fn out_degree(&self, n: &N) -> usize {
        match self.successors.get(n) {
            None => 0,
            Some(ref succ) => succ.len(),
        }
    }

    pub fn display_dot(
        &self,
        fmt: &mut Formatter,
        fmt_node: &Fn(&N, &mut Formatter) -> Result<(), Error>,
    ) -> Result<(), Error>
    where
        N: Display,
    {
        writeln!(fmt, "digraph G {{")?;
        for n in &self.nodes {
            write!(fmt, "\"{}\" [label=\"", n)?;
            fmt_node(&n, fmt)?;
            writeln!(fmt, "\"];")?;
        }
        for n in &self.nodes {
            match self.successors.get(n) {
                None => (),
                Some(ref succs) => {
                    for m in succs.iter() {
                        writeln!(fmt, "\"{}\" -> \"{}\"", n, m)?;
                    }
                }
            }
        }
        writeln!(fmt, "}}")
    }
}

impl<N> Display for Graph<N>
where
    N: Hash + Eq + Copy + Display,
{
    fn fmt(&self, fmt: &mut Formatter) -> Result<(), Error> {
        self.display_dot(fmt, &Display::fmt)
    }
}

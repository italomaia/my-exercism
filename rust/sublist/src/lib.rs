// ref: alireza4050

// the idea here is to rely on windows to give us each contiguous slice
// of size equal to the slice we want to compare against;
// using a tuple with match + the arg if conditions was quite elegant.

#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(a: &[T], b: &[T]) -> Comparison {
  use Comparison::*;

  match (a.len(), b.len()) {
    (0, 0) => Equal,
    (0, _) => Sublist,
    (_, 0) => Superlist,
    (m, n) if m > n => if a.windows(n).any(|w| w == b) {Superlist} else {Unequal},
    (m, n) if m < n => if b.windows(m).any(|w| w == a) {Sublist} else {Unequal},
    (_, _) => if a == b {Equal} else {Unequal}
  }
}

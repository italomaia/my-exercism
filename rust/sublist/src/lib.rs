#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

fn is_subset<T: PartialEq> (a: &[T], b: &[T]) -> bool {
  for i in 0..=(b.len() - a.len()) {
    if a == &b[i..(i + a.len())] {
      return true
    }
  }
  false
}

pub fn sublist<T: PartialEq>(a: &[T], b: &[T]) -> Comparison {
  if a.len() == 0 {
    return Comparison::Sublist;
  }

  if b.len() == 0 {
    return Comparison::Superlist;
  }

  match a.len().cmp(&b.len()) {
    std::cmp::Ordering::Less => {
      match is_subset(a, b) {
        true  => Comparison::Sublist,
        _     => Comparison::Unequal
      }
    },
    std::cmp::Ordering::Greater => {
      match is_subset(b, a) {
        true  => Comparison::Superlist,
        _     => Comparison::Unequal
      }
    },
    _ => {
      match a.eq(b) {
        true  => Comparison::Equal,
        false => Comparison::Unequal
      }
    },
  }
}

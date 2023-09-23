use std::cmp;

// note the solution converts usize to isize; that means we cannot
// access all possible positions in minefield if minefield is too large
// and might trigger a indexError for some corner cases

const SPACE: u8 = ' ' as u8;
const MINE: u8 = '*' as u8;
const ZERO: u8 = '0' as u8;

fn count_mines(x: isize, y: isize, minefield: &[&str], lines: isize, cols: isize) -> u8 {
  let mut count: u8 = 0;

  for p0 in cmp::max(0, x-1)..cmp::min(x+2, lines) {
    for p1 in cmp::max(0, y-1)..cmp::min(y+2, cols) {
      if (p0 == x) && (p1 == y) { continue }

      if minefield[p0 as usize].as_bytes()[p1 as usize] == MINE {
        count += 1;
      }
    }
  }

  count
}

pub fn annotate(minefield: &[&str]) -> Vec<String> {
  let size = minefield.len() as isize;

  minefield.iter().enumerate().map(|(x, row)| {
    String::from_utf8(
      row.as_bytes().iter().enumerate().map(move |(y, field)| {
        if field == &SPACE {
          let count = count_mines(x as isize, y as isize, minefield, size, row.len() as isize);
          return match count.cmp(&0) {
            cmp::Ordering::Equal => SPACE,
            _ => count + ZERO
          }
        }

        MINE
      })
      .collect::<Vec<u8>>()
    ).unwrap()
  }).collect()
}

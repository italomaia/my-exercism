use std::cmp;

const SPACE: u8 = 32;
const MINE: u8 = 42;

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
  let mut rs: Vec<String> = Vec::new();
  let lines = minefield.len() as isize;
  let cols = match lines.cmp(&0) {
    cmp::Ordering::Equal => 0,
    _ => minefield[0].len()
  } as isize;

  for x in 0..lines {
    let row: Vec<u8> = minefield[x as usize].as_bytes().iter().enumerate().map(|(y, field)| {
      if field == &SPACE {
        let count = count_mines(x as isize, y as isize, minefield, lines, cols);
        return match count.cmp(&0) {
          cmp::Ordering::Equal => SPACE,
          _ => count + 48
        }
      }

      MINE
    }).collect();
    rs.push(String::from_utf8(row).unwrap());
  }

  rs
}

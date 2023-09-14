use std::collections::HashSet;
// really nice solution, LoipesMas!

/*
The idea here is to transform the string into a lowcase sorted vector
of characters and compare with a lowcase sorted vector
of characters of word.

This design is interesting because rust does not allow the return
of references to local variables.
*/
pub fn anagrams_for<'a>(word: &'a str, possible_anagrams: &'a [&str]) -> HashSet<&'a str> {
  let word_lc = word.to_lowercase();
  let mut word_vec: Vec<char> = word_lc.chars().collect();
  word_vec.sort_unstable();

  let rs: Vec<&str> = possible_anagrams.iter()
    .filter(|a| {
      let a = a.to_lowercase();
      if a == word_lc { return false }

      let mut anagram: Vec<char> = a.chars().collect();
      anagram.sort_unstable();
      word_vec == anagram
    })
    .map(|&a| a)
    .collect()
  ;

  return HashSet::from_iter(rs)
}

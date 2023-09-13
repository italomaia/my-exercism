use std::collections::{HashSet, HashMap};

fn char_count(word: String) -> HashMap<char, u32> {
    let mut count: HashMap<char, u32> = HashMap::new();

    for c in word.chars() {
        count.insert(c, count
            .get(&c)
            .or(Some(&0))
            .unwrap() + 1
        );
    }

    count
}

fn is_anagram<'a>(word: &'a str, anagram: &'a str) -> Option<&'a str> {
    let word_count = char_count(word.to_lowercase());
    let anagram_count = char_count(anagram.to_lowercase());

    if (word_count == anagram_count) && (word.to_lowercase() != anagram.to_lowercase()) {
        return Some(anagram)
    }

    None
}

pub fn anagrams_for<'a>(word: &'a str, possible_anagrams: &'a [&str]) -> HashSet<&'a str> {
    HashSet::from_iter(possible_anagrams
      .iter()
      .map(| anagram | is_anagram(word, anagram))
      .filter(|v| v.is_some())
      .map(|v| v.unwrap()))
}

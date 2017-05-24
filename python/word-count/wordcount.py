def word_count(words):
    words_dict = dict()
    for word in words.lower().split():
        words_dict[word] = words_dict.get(word, 0) + 1
    return words_dict
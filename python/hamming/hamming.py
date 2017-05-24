def distance(strand_a, strand_b):
    length = len(strand_a)
    return length - sum([strand_a[i] == strand_b[i] for i in range(length)])
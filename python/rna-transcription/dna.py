def to_rna(dna):
    table = {'G': 'C', 'C': 'G', 'T': 'A', 'A': 'U'}
    return ''.join([table[nuc] for nuc in dna])
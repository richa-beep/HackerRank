def count_substring(string, sub_string):
    return sum(string[i:].startswith(sub_string) for i in range(len(string)))


def is_anagram(str1, str2):
    return sorted(str1) == sorted(str2)

# Example usage
str1 = 'listen'
str2 = 'silent'
print(is_anagram(str1, str2))
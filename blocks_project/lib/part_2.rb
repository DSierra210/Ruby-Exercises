def all_words_capitalized?(array)
    array.all? { |word| word == word.capitalize }
end

def no_valid_url?(array)
    array.none? { |url| url.end_with?(".com", ".net", ".io", ".org")  } 
end

def any_passing_students?(array)
    array.any? { |hash| (hash[:grades].sum / hash[:grades].length) >= 75  }
end
def hipsterfy(word)
    vowels = "aeiou"
    new_str = ""
    reversed_str = word.reverse
    reversed_str.each_char.with_index do |char, idx|
        if vowels.include?(char)
            new_str += reversed_str[0...idx] + reversed_str[idx + 1..-1]
            return new_str.reverse
        end
    end
    return word
end

def vowel_counts(sent)
    vowels = "aeiou"
    count = Hash.new(0)
    sent.downcase.each_char do |char|
        if vowels.include?(char)
            count[char] += 1
        end
    end
    return count.sort_by { |key, value| value }.reverse.to_h
end

def caesar_cipher(word, num)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    cipher = ""
    word.each_char do |char|
        if alphabet.include?(char)
            cipher += alphabet[(alphabet.index(char) + num) % alphabet.length]
        else
            cipher += char
        end
    end
    cipher
end
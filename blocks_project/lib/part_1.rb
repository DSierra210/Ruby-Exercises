def select_even_nums(array)
    array.select(&:even?)
end

def reject_puppies(array)
    array.reject { |hash| hash["age"] <= 2 }
end

def count_positive_subarrays(array)
    array.count{ |ele| ele.sum > 0 }
end

def aba_translate(string)
    vowels = "aeiou"
    i = 0
    new_str = ""
    while i < string.length
        char = string[i]
        if vowels.include?(char)
            new_str += char + "b" + char
            i += 1
            next
        else
            new_str += char
        end
        i += 1
    end
    new_str
end

def aba_array(array)
    array.map { |ele| aba_translate(ele) }
end
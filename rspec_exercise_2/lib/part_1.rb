def partition(arr, num)
    arr1 = []
    arr2 = []
    arr.each do |ele| 
        if num > ele
            arr1 << ele
        else
            arr2 << ele
        end
    end
    [arr1,arr2]  
end

def merge(h1, h2)
    h1.merge(h2)
end

def censor(sent, arr)
    censoring = sent.split(" ").map do |word|
        if arr.include?(word.downcase)
            censor_word(word)
        else
            word
        end
    end
    censoring.join(" ")
end
def censor_word(word) # Helper Method
    vowels = "aeiou"
    new_word = ""
    word.each_char do |char| 
        if vowels.include?(char.downcase) 
            new_word += "*"
        else
            new_word += char
        end
    end
    new_word
end

def power_of_two?(num)
    num == 2 ** (Math.log2(num)).to_i
end
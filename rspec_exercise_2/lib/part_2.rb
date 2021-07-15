def palindrome?(str)
    rev_str = ""
    i = 0
    while i < str.length
        rev_str = str[i] + rev_str
        i += 1
    end
    str == rev_str
end

def substrings(str)
    arr = []
    i = 0
    while i < str.length 
        arr << str[i]
        n = i + 1
        while n < str.length
            arr << str[i..n]
            n += 1
        end
        i += 1
    end
    arr
end

def palindrome_substrings(str)
    substrings(str).select { |ele| palindrome?(ele) && ele.length > 1 }
end
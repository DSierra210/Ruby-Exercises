# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def largest_prime_factor(num)
    (2..num).reverse_each do |factor|
        return factor if num % factor == 0 && is_prime?(factor)
    end
end

def is_prime?(num)
    return false if num < 2
    (2...num).each { |factor| return false if num % factor == 0 }
    true
end

def unique_chars?(string)
    letter = Hash.new(0)
    string.each_char { |char| letter[char] += 1  }
    letter.each_value { |val| return false if val != 1 }
    true
end

def dupe_indices(array)
    index_h = Hash.new([])
    return index_h if unique_chars?(array.join(""))
    array.each.with_index { |ele, i| index_h[ele] += [i]}
    index_h.keep_if { |key, val| val.length != 1 }
end

def ana_array(arr1, arr2)
    count_arr(arr1) == count_arr(arr2)
end

def count_arr(arr)
    count = Hash.new(0)
    arr.each { |ele| count[ele] += 1 }
    count
end

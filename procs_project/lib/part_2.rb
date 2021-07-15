def reverser(string, &prc)
    prc.call(string.reverse)
end

def word_changer(string, &prc)
    string.split(" ").map { |word| prc.call(word) }.join(" ")
end

def greater_proc_value(num, proc_1, proc_2)
    if proc_1.call(num) > proc_2.call(num)
        return proc_1.call(num)
    else
        return proc_2.call(num)
    end
end

def and_selector(arr, proc_1, proc_2)
    new_arr = []
    arr.each { |ele| new_arr << ele if proc_1.call(ele) && proc_2.call(ele) }
    new_arr
end

def alternating_mapper(arr, proc_1, proc_2)
    new_arr = []
    arr.each.with_index do |ele, i|
        if i % 2 == 0
            new_arr << proc_1.call(ele)
        else
            new_arr << proc_2.call(ele)
        end
    end
    new_arr
end
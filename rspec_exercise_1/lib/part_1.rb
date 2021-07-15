def average(num_1, num_2)
    (num_1 + num_2)/2.0
end

def average_array(arr)
    arr.sum(0.0)/arr.length
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sent)
    i = 0
    str = []
    sent_array = sent.split(" ")
    while i < sent_array.length - 1
        str.push(sent_array[i].upcase, sent_array[i + 1].downcase)
        i += 2
    end
    str.join(" ")
end
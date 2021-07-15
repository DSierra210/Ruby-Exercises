# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return self.max - self.min if self.length > 0

        nil
    end

    def average
        return nil if self.length == 0

        self.sum(0.0) / self.length
    end

    def median
        return nil if self.length == 0
        sorted = self.sort
        if sorted.length.odd?
            return sorted[(sorted.length * 1.0) / 2]
        else
            first = sorted[(sorted.length - 1) / 2]
            second = sorted[(sorted.length * 1.0) / 2]
            return [first,second].average
        end
    end

    def counts 
        count = Hash.new(0)
        self.each { |ele| count[ele] += 1 }
        count
    end

    def my_count(ele)
        count = Hash.new(0)
        self.each { |el| count[el] += 1 }
        count[ele]
    end

    def my_index(ele)
        self.each.with_index { |el, idx| return idx if el == ele }
        
        nil
    end

    def my_uniq
        new_arr = []
        self.counts.each_key {|k| new_arr << k}
        new_arr
    end

    def my_transpose
        self[0].zip(*self[1..-1])
    end

end

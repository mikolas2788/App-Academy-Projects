# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        return nil if self.empty?
        self.max - self.min
    end 

    def average 
        return nil if self.empty?
        self.sum / self.length.to_f
    end 

    def median
        return nil if self.empty?
        length = self.length
        midpoint = length/2
        length.odd? ? self.sort[midpoint] : self.sort[midpoint-1..midpoint].average
    end 

    def counts
        counter = Hash.new(0)
        self.each { |ele| counter[ele] += 1 }
        counter
    end 

    def my_count(value)
        counter = 0
        self.each { |ele| counter += 1 if ele == value }
        counter 
    end 

    def my_index(value)
        self.each_with_index { |ele, idx| return idx if ele == value }
        nil
    end 

    def my_uniq
        new_arr = []
        self.each { |ele| new_arr << ele if !new_arr.include?(ele) }
        new_arr
    end 

    def my_transpose 
        transposed = Array.new(self[0].length) { Array.new(self.length) }

        self.each_with_index do |column, idx1|
            column.each_with_index do |row, idx2|
                transposed[idx2][idx1] = self[idx1][idx2]
            end 
        end 

        transposed
    end 
end

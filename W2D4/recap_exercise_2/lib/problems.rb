# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    largest = [num_1, num_2].max
    largest_multiple = num_1 * num_2

    (largest..largest_multiple).each { |int| return int if int % num_1 == 0 && int % num_2 == 0 }
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    hash = Hash.new(0)

    (0...str.length-1).each do |idx|
        bigram = str[idx..idx+1]
        hash[bigram] += 1
    end 

    hash.keys.inject do |max, bigram| 
        if hash[max] > hash[bigram]
            max
        else 
            bigram
        end 
    end 
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = Hash.new

        self.each { |k, v| new_hash[v] = k }

        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        
        count = 0

        self.each_with_index do |num1, idx1|
            self[idx1+1..-1].each do |num2|
                count += 1 if num1 + num2 == num
            end     
        end 

        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        sorted = false

        prc ||= Proc.new { |num1, num2| num1 <=> num2 }
        while !sorted
            sorted = true

            (0...self.length-1).each do |idx|
                num = self[idx]
                next_num = self[idx+1]
                if prc.call(num, next_num) == 1
                    self[idx], self[idx+1] = self[idx+1], self[idx]
                    sorted = false
                end 
            end 
        end 
        
        self
    end
end

# Write a method that doubles each element in an array. Assume all elements of
# the array are integers.

def doubler(array)
    array.map { |num| num * 2 }
end



# A palindrome is a word or sequence of words that reads the same backwards as
# forwards. Write a method that returns the length of the longest palindrome in
# a given string. If there is no palindrome longer than two letters, return false.

def longest_palindrome(string)
    longest = ""

    (0...string.length-1).each do |idx1|
        (idx1...string.length).each do |idx2|
            substring = string[idx1..idx2]
            if substring == substring.reverse && substring.length > longest.length
                longest = substring
            end 
        end 
    end 

    longest.length > 2 ? longest.length : false
end



class Array
# Write an `Array#my_any?(&prc)` method. This method should return true if any
# of the Array elements satisfy the block, otherwise it should return false.

# Examples: 
# `[1,2,3].my_any? { |n| n.even? }` => true
# `[1,3,5].my_any? { |n| n.even? }` => false

def my_any?(&prc)

    self.each do |ele| 
        if prc.call(ele)
            return true
        end 
    end 

    false 
    end
end



class Array
# Write an `Array#my_inject` method. If my_inject receives no argument, then
# use the first element of the array as the default accumulator.
# **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
# implementation.**

def my_inject(accumulator = nil, &prc)
    accumulator ||= self.shift

    self.each do |ele| 
        accumulator = prc.call(accumulator, ele)
    end 

    accumulator
    end
end



# Write a recursive method that returns the first "num" factorial numbers in
# ascending order. Note that the 1st factorial number is 0!, which equals 1.  
# The 2nd factorial is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
    return [1] if num == 1
    fac = factorials_rec(num-1)
    fac << fac.last * (num-1)
    fac
end



class Array
# Write a monkey patch of binary search:
# E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
# **Do NOT use the built in `Array#index` `Array#find_index`, `Array#include?`,
# or `Array#member` methods in your implementation.**

# NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
# We will not give you points if you visit every element in the array every 
# time you search.

# For example, given the array [1, 2, 3, 4], you should NOT be checking
# 1 first, then 2, then 3, then 4.

    def my_bsearch(target)
        return nil if self.empty?

        midpoint = self.length / 2
        current = self[midpoint]
        return midpoint if current == target

        left = self[0...midpoint]
        right = self[midpoint+1..-1]

        if current > target
            left.my_bsearch(target)
        else 
            result = right.my_bsearch(target)
            result.nil? ? nil : result + midpoint + 1
        end 
    end
end
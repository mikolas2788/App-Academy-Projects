require 'byebug'

def range(start, last)
    return [] if last < start  
    return [start] if last - start == 1
    range(start, last-1).push(last-1)
end 

p range(1, 5) #[1, 2, 3, 4] == range(1, 4) + [4]
p range(1, 4) #[1, 2, 3]
p range(1, 3) #[1, 2]
p range(1, 2) #[1]


def iterative_sum(array)
    array.inject { |acc, num| acc += num }
end 

p iterative_sum([1,5,10]) 
p iterative_sum([1,8,19])


def recursive_sum(array)
    return array[0] if array.length == 1
    total = array.shift
    total += recursive_sum(array)
end 

p recursive_sum([1,5,10]) 
p recursive_sum([1,8,19])


def exponent_1(base, num)
    return 1 if num == 0

    base * exponent_1(base, num - 1)
end

p exponent_1(2, 3)
p exponent_1(2, 4)

def exponent_2(base, num)
    return 1 if num == 0 
    return base if num == 1

    if num.even? 
        exponent_2(base, num/2) ** 2
    else 
        base * (exponent_2(base, (num-1)/2) ** 2)
    end 
end 

p exponent_2(2, 3)
p exponent_2(2, 4)


def deep_dup(array)
    new_array = []
    array.each do |ele|
        if ele.is_a?(Array)
            new_array << deep_dup(ele)
        else
            new_array << ele
        end 
    end 

    new_array
end 

p array = [1, [2]]
p array2 = deep_dup(array)
p array.object_id == array2.object_id
p array.object_id[1] == array2.object_id


def recursive_fibonacci(num)
    return [1] if num == 1
    return [1, 1] if num == 2

    previous_fib = recursive_fibonacci(num-1)
    previous_fib << previous_fib[-1] + previous_fib[-2]
end 

p recursive_fibonacci(2) # [1, 1]
p recursive_fibonacci(3) # [1, 1, 2]
p recursive_fibonacci(4) # [1, 1, 2, 3]
p recursive_fibonacci(5) # [1, 1, 2, 3, 5]


def iterative_fibonacci(num)
    result = [1, 1]
    attempts = num - result.length

    attempts.times { |i| result << result[-1] + result[-2] }

    result
end 

p iterative_fibonacci(2) # [1, 1]
p iterative_fibonacci(3) # [1, 1, 2]
p iterative_fibonacci(4) # [1, 1, 2, 3]
p iterative_fibonacci(5) # [1, 1, 2, 3, 5]


def binary_search(array, target)
    return nil if array.empty?
    midpoint = array.length / 2
    left = array[0...midpoint]
    right = array[midpoint+1..-1]
    if array[midpoint] == target
        return midpoint
    elsif target < array[midpoint]
        binary_search(left, target)
    else 
        res = binary_search(right, target)
        res.nil? ? nil : midpoint + res + 1
    end
end

p binary_search([1,2,3,4,5], 2)
p binary_search([1,2,3,4,5], 3)
p binary_search([1,2,3,4,5], 5)
p binary_search([1,2,3,4,5], 6)


def merge_sort(array)
    return array if array.length <= 1

    midpoint = array.length / 2
    left = array[0...midpoint]
    right = array[midpoint..-1]

    sorted_left = merge_sort(left)
    sorted_right = merge_sort(right)

    merge(sorted_left, sorted_right)
end 

def merge(left, right)
    merged = []

    until left.empty? || right.empty?
        left_num = left.shift
        right_num = right.shift
        
        if left_num < right_num
            merged << left_num
        else 
            merged << right_num
        end 
    end 

    merged + left + right
end 

# Merge Sort
def merge_sort(arr)
    return arr if arr.length <= 1
  
    pivot = arr.length/2
    left = arr[0...pivot]
    right = arr[pivot..-1]
  
    sorted_left = merge_sort(left)
    sorted_right = merge_sort(right)
  
    merge(sorted_left, sorted_right)
  end
  
  def merge(sorted_left, sorted_right)
    merged = []
    until sorted_left.empty? || sorted_right.empty?
      if sorted_left[0] < sorted_right[0]
        merged << sorted_left.shift
      else  
        merged << sorted_right.shift
      end
    end
    merged + sorted_left + sorted_right
  end 
  
#   Test Case
p merge_sort([]) # []
p merge_sort([1]) # [1]
p merge_sort([3,7,4,1,6,4])
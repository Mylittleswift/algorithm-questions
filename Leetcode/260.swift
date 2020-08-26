/***
 260. Single Number III
 Medium

 Given an array of numbers nums, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once.
 
 Example:
 
 Input:  [1,2,1,3,2,5]
 Output: [3,5]
 Note:
 
 The order of the result is not important. So in the above example, [5, 3] is also correct.
 Your algorithm should run in linear runtime complexity. Could you implement it using only constant space complexity?
 ***/



class Solution260x1 {
    func singleNumber(_ nums: [Int]) -> [Int] {
        
        var res = [0, 0]
        var diff = nums.reduce(0){$0 ^ $1}
        diff &= -diff
        for num in nums {
            if num & diff != 0 {
                res[0] ^= num
            }
            else {
                res[1] ^= num
            }
        }
        return res
    }
}


class Solution260x2 {
    func singleNumber(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        var result = nums[0]
        for num in nums[1...] {
            result ^= num
        }
        
        var num1 = 0, num2 = 0, tmp = 1
        while (result & tmp) == 0 {
            tmp <<= 1
        }
        
        for num in nums {
            if (num & tmp) > 0 {
                num1 ^= num
            }
            else {
                num2 ^= num
            }
        }
        
        return [num1, num2]
    }
}


class Solution260x3 {
    func singleNumber(_ nums: [Int]) -> [Int] {
        var s: Set<Int> = Set(minimumCapacity: nums.count)
        for i in nums {
            if s.contains(i) {
                s.remove(i)
            } else {
                s.insert(i)
            }
        }
        return Array(s)
    }
}


class Solution260x4 {
    func singleNumber(_ nums: [Int]) -> [Int] {
        var array = nums.sorted()
        // print(array)
        var output:[Int] = []
        
        var i = 0
        while i < array.count {
            if i == array.count - 1 || array[i] != array[i+1] {
                output.append(array[i])
            } else {
                i += 1
            }
            i += 1
            if output.count > 1 {
                break
            }
        }
        
        return output
    }
}

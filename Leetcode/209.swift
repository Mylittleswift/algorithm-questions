/***
 209. Minimum Size Subarray Sum
 Medium

 Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.
 
 Example:
 
 Input: s = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: the subarray [4,3] has the minimal length under the problem constraint.
 Follow up:
 If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n).
 ***/



class Solution209x1 {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var i = 0, j = 0,minX = nums.count, sum = nums[0], match = false
        while j < nums.count {
            if i == j {
                if sum < s {
                    j = j + 1
                    if j == nums.count {
                        break;
                    }
                    sum = nums[j] + sum
                } else {
                    return 1
                }
            } else {
                if sum < s {
                    j = j + 1
                    if j == nums.count {
                        break
                    }
                    sum = nums[j] + sum
                } else {
                    match = true
                    minX = min(j - i + 1, minX)
                    sum = sum - nums[i]
                    i = i + 1
                }
            }
        }
        return match ? minX : 0
    }
}


class Solution209x2 {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        
        var sum = 0, left = 0, res = Int.max
        for i in nums.indices {
            sum += nums[i]
            while sum >= s {
                res = min(res, i-left+1)
                sum -= nums[left]
                left += 1
            }
        }
        return (res == Int.max) ? 0 : res
    }
}


class Solution209x3 {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var miniSize = Int.max ,start = 0, currentSum = 0
        
        for (i, num) in nums.enumerated() {
            currentSum += num
            
            while currentSum >= s && start <= i {
                miniSize = min(miniSize, i - start + 1)
                
                currentSum -= nums[start]
                start += 1
            }
        }
        
        return miniSize == Int.max ? 0 : miniSize
    }
}



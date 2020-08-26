/***
 300. Longest Increasing Subsequence
 Medium

 Given an unsorted array of integers, find the length of longest increasing subsequence.
 
 Example:
 
 Input: [10,9,2,5,3,7,101,18]
 Output: 4
 Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
 Note:
 
 There may be more than one LIS combination, it is only necessary for you to return the length.
 Your algorithm should run in O(n2) complexity.
 Follow up: Could you improve it to O(n log n) time complexity?
 ***/



class Solution300x1 {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return nums.count
        }
        var res = Array(repeating: 0, count: nums.count)
        res[0] = nums[0]
        var count = 1
        var j = 0
        for i in 0..<nums.count {
            let tmp = nums[i]
            if tmp > res[count - 1] {
                j = count
                count += 1
            }else {
                var left = 0
                var right = count - 1
                while left < right {
                    let mid = (left + right) / 2
                    if res[mid] >= nums[i] {
                        right = mid
                    }else {
                        left = mid + 1
                    }
                }
                j = left
            }
            res[j] = nums[i]
        }
        return count
    }
}


class Solution300x2 {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var results = [Int]()
        for num in nums {
            var needAdd = true
            if results.count > 0 {
                for index in 0..<results.count {
                    if num <= results[index] {
                        results[index] = num
                        needAdd = false
                        break
                    }
                }
            }
            if needAdd {
                results.append(num)
            }
        }
        return results.count
    }
}

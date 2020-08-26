/***
 55. Jump Game
 Medium

 Given an array of non-negative integers, you are initially positioned at the first index of the array.
 
 Each element in the array represents your maximum jump length at that position.
 
 Determine if you are able to reach the last index.
 
 
 
 Example 1:
 
 Input: nums = [2,3,1,1,4]
 Output: true
 Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Example 2:
 
 Input: nums = [3,2,1,0,4]
 Output: false
 Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
 
 
 Constraints:
 
 1 <= nums.length <= 3 * 10^4
 0 <= nums[i][j] <= 10^5
 ***/


class Solution55x1 {
    func canJump(_ nums: [Int]) -> Bool {
        var bestPos = 0
        
        var i = nums.count - 1
        while (i >= 0 ) {
            if (nums[i] + i >= bestPos) {
                bestPos = i
            }
            i -= 1
        }
        
        return bestPos == 0
    }
}


class Solution55x2 {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.isEmpty { return true }
        var ind = nums.count - 1
        for i in (0..<nums.count).reversed() {
            if (i + nums[i]) >= ind {
                ind = i
            }
        }
        return ind == 0
    }
}


class Solution55x3 {
    func canJump(_ nums: [Int]) -> Bool {
        var maxIndex = nums[0]
        
        for (index, val) in nums.enumerated() {
            
            if index > maxIndex {
                return false
            }
            
            maxIndex = max(maxIndex, index + val)
        }
        
        return true
    }
}


class Solution55x4 {
    func canJump(_ nums: [Int]) -> Bool {
        let count = nums.count
        if count > 0 {
            var index = 1 // 现在检查
            var maxIndex = nums.first! // 现在最多去到
            if maxIndex >= count - 1 {
                return true
            }
            var newIndex = 0 // 新的最多去到
            
            while index <= maxIndex {
                newIndex = nums[index] + index
                if newIndex > maxIndex {
                    maxIndex = newIndex
                    if newIndex >= count - 1 {
                        return true
                    }
                }
                index += 1
            }
        }
        return false
    }
}


class Solution55x5 {
    func canJump(_ nums: [Int]) -> Bool {
        var lastPos = 0
        for (index, num) in nums.enumerated() {
            if index > lastPos {
                return false
            }
            
            lastPos = max(lastPos, num + index)
        }
        
        return true
    }
}

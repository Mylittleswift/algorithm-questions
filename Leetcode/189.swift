/***
 189. Rotate Array
 Easy

 Given an array, rotate the array to the right by k steps, where k is non-negative.
 
 Follow up:
 
 Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
 Could you do it in-place with O(1) extra space?
 
 
 Example 1:
 
 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 Example 2:
 
 Input: nums = [-1,-100,3,99], k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]
 
 
 Constraints:
 
 1 <= nums.length <= 2 * 10^4
 It's guaranteed that nums[i] fits in a 32 bit-signed integer.
 k >= 0
 ***/



class Solution189x1 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard nums.count > 1 else {
            return
        }
        
        guard k > 0 else {
            return
        }
        
        let k = k % nums.count
        nums = Array(nums[(nums.count - k)..<nums.count]) + Array(nums[0..<(nums.count - k)])
    }
}


class Solution189x2 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let n = nums.count
        let numRoations = k % n
        var rotated = [Int]()
        for i in n-numRoations..<n {
            rotated.append(nums[i])
        }
        for j in 0..<n-numRoations {
            rotated.append(nums[j])
        }
        nums = rotated
    }
}


class Solution189x3 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        rotate1(&nums, k)
    }
    
    func rotate1(_ nums: inout [Int], _ k: Int) {
        var r: [Int] = Array(repeating: 0, count: nums.count)
        var kk = nums.count - (k % nums.count)
        for i in 0..<nums.count {
            r[i] = nums[(i + kk) % nums.count]
        }
        for (i, num) in r.enumerated() {
            nums[i] = num
        }
    }
}

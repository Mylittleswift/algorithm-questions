/***
 75. Sort Colors
 Medium

 Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.
 
 Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
 
 Note: You are not suppose to use the library's sort function for this problem.
 
 Example:
 
 Input: [2,0,2,1,1,0]
 Output: [0,0,1,1,2,2]
 Follow up:
 
 A rather straight forward solution is a two-pass algorithm using counting sort.
 First, iterate the array counting number of 0's, 1's, and 2's, then overwrite array with total number of 0's, then 1's and followed by 2's.
 Could you come up with a one-pass algorithm using only constant space?
 ***/



class Solution75x1 {
    func sortColors(_ nums: inout [Int]) {
        
        var i = 0
        var left = 0
        var right = nums.count - 1
        
        while i <= right {
            if nums[i] == 0 {
                nums.swapAt(i, left)
                i += 1
                left += 1
            } else if nums[i] == 1 {
                i += 1
            } else {
                nums.swapAt(i, right)
                right -= 1
            }
        }
    }
}


class Solution75x2 {
    /// 桶排序法, 0...red 都是 0，blue...nums.count-1 都是2
    func sortColors(_ nums: inout [Int]) {
        var red = -1
        var blue = nums.count
        var i = 0
        
        while i < blue {
            if nums[i] == 0 {
                red += 1
                (nums[i], nums[red]) = (nums[red], nums[i])
                i += 1
            } else if nums[i] == 2 {
                blue -= 1
                (nums[i], nums[blue]) = (nums[blue], nums[i])
            } else {
                i += 1
            }
        }
    }
}



class Solution75x3 {
    func sortColors(_ nums: inout [Int]) {
        var zeroCounter = 0
        var oneCounter = 0
        var twoCounter = 0
        
        for each in nums{
            if each == 0{
                zeroCounter += 1
            }else if each == 1{
                oneCounter += 1
            }else if each == 2{
                twoCounter += 1
            }
        }
        
        for each in 0..<zeroCounter{
            nums[each] = 0
        }
        
        for each in 0..<oneCounter{
            nums[zeroCounter+each] = 1
        }
        
        for each in 0..<twoCounter{
            nums[zeroCounter+oneCounter+each] = 2
        }
        
    }
}


class Solution75x4 {
    func sortColors(_ nums: inout [Int]) {
        var redCount = 0, whiteCount = 0, blueCount = 0
        for i in 0..<nums.count {
            if nums[i] == 0 {
                redCount = redCount + 1
                nums[redCount - 1] = 0
            } else if nums[i] == 1 {
                whiteCount = whiteCount + 1
            } else {
                blueCount = blueCount + 1
            }
        }
        for i in redCount..<redCount+whiteCount {
            nums[i] = 1
        }
        for i in redCount+whiteCount..<nums.count {
            nums[i] = 2
        }
    }
}

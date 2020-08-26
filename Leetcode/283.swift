/***
 283. Move Zeroes
 Easy

 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 
 Example:
 
 Input: [0,1,0,3,12]
 Output: [1,3,12,0,0]
 Note:
 
 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.
 ***/


class Solution283x1 {
    func moveZeroes(_ nums: inout [Int]) {
        //0要后移，反意是非0元素前移。
        if nums == nil || nums.count == 0
        {
            return
        }
        //记录非0元素开始位置
        var j:Int = 0
        for i in 0..<nums.count
        {
            if nums[i] != 0
            {
                nums[j] = nums[i]
                j += 1
            }
        }
        while(j < nums.count)
        {
            nums[j] = 0
            j += 1
        }
    }
}


class Solution283x2 {
    func moveZeroes(_ nums: inout [Int]) {
        var index1 = 0
        var index2 = nums.count
        while index1 <= index2 - 1 {
            if nums[index1] == 0 {
                for _ in 0..<(index2-index1) {
                    index2 -= 1
                    if nums[index2] != 0 {
                        nums.remove(at: index1)
                        nums.append(0)
                        break;
                    }
                }
            }else {
                index1 += 1
            }
        }
    }
}

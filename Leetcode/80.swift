/***
 80. Remove Duplicates from Sorted Array II
 Medium

 Given a sorted array nums, remove the duplicates in-place such that duplicates appeared at most twice and return the new length.
 
 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
 
 Example 1:
 
 Given nums = [1,1,1,2,2,3],
 
 Your function should return length = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively.
 
 It doesn't matter what you leave beyond the returned length.
 Example 2:
 
 Given nums = [0,0,1,1,1,1,2,3,3],
 
 Your function should return length = 7, with the first seven elements of nums being modified to 0, 0, 1, 1, 2, 3 and 3 respectively.
 
 It doesn't matter what values are set beyond the returned length.
 Clarification:
 
 Confused why the returned value is an integer but your answer is an array?
 
 Note that the input array is passed in by reference, which means modification to the input array will be known to the caller as well.
 
 Internally you can think of this:
 
 // nums is passed in by reference. (i.e., without making a copy)
 int len = removeDuplicates(nums);
 
 // any modification to nums in your function would be known by the caller.
 // using the length returned by your function, it prints the first len elements.
 for (int i = 0; i < len; i++) {
 print(nums[i]);
 }
 ***/



class Solution80x1 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 { return 0 }
        var result = 0
        
        var j = 1
        var repeatCount = 0
        var pre = nums[0]
        for i in 1..<nums.count {
            if nums[i] == pre {
                repeatCount += 1
                if repeatCount <= 1 {
                    nums[j] = nums[i]
                    j += 1
                }
            } else {
                pre = nums[i]
                repeatCount = 0
                nums[j] = nums[i]
                j += 1
            }
        }
        return j
    }
}


class Solution80x2 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard !nums.isEmpty else {return 0}
        var ip = 0, currCount = 1
        for jp in 1..<nums.count {
            if nums[ip] == nums[jp] {
                currCount += 1
            } else {
                currCount = 1
            }
            if currCount <= 2 {
                ip += 1
                (nums[ip], nums[jp]) = (nums[jp], nums[ip])
            }
        }
        return ip + 1
    }
}


class Solution80x3 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var i = 0
        for num in nums {
            if i < 2 || num > nums[i-2] {
                nums[i] = num
                i += 1
            }
        }
        nums[i...] = []
        return i
    }
}


class Solution80x4 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var position = 1 // [0..<position]: result array
        var pre = nums[0] // previous value to compare with
        var repeatCount = 0
        for i in 1 ..< nums.count {
            if nums[i] == pre {
                repeatCount += 1
                if repeatCount <= 1 {
                    // repeat count less than 2, put the value into the result position
                    nums[position] = nums[i]
                    position += 1
                }
            } else {
                repeatCount = 0
                // not equal to previous value, put it into the result position
                pre = nums[i]
                nums[position] = nums[i]
                position += 1
            }
        }
        nums[position...] = []
        return position
    }
}

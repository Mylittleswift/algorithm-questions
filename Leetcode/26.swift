/***
 26. Remove Duplicates from Sorted Array
 Easy

 Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.
 
 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
 
 Example 1:
 
 Given nums = [1,1,2],
 
 Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.
 
 It doesn't matter what you leave beyond the returned length.
 Example 2:
 
 Given nums = [0,0,1,1,1,2,2,3,3,4],
 
 Your function should return length = 5, with the first five elements of nums being modified to 0, 1, 2, 3, and 4 respectively.
 
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


class Solution26x1 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {return 0}
        //定义返回的数组新长度
        var i = 0
        //遍历数组
        for num in nums {
            if num != nums[i] {
                i += 1
                nums[i] = num
            }
        }
        return i + 1
    }
}


class Solution26x2 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var length = 0
        if nums.count > 0 {
            length = 1
            var prev = nums[0]
            var currentIndex = 1
            var index = 1
            while index < nums.count {
                while(index < nums.count && nums[index] == prev) {
                    index += 1
                }
                if index < nums.count && nums[index] != prev {
                    nums[currentIndex] = nums[index]
                    prev = nums[currentIndex]
                    length += 1
                    currentIndex += 1
                }
            }
        }
        return length
    }
        
}



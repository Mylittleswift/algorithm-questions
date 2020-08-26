/***
 164. Maximum Gap
 Hard

 Given an unsorted array, find the maximum difference between the successive elements in its sorted form.
 
 Return 0 if the array contains less than 2 elements.
 
 Example 1:
 
 Input: [3,6,9,1]
 Output: 3
 Explanation: The sorted form of the array is [1,3,6,9], either
 (3,6) or (6,9) has the maximum difference 3.
 Example 2:
 
 Input: [10]
 Output: 0
 Explanation: The array contains less than 2 elements, therefore return 0.
 Note:
 
 You may assume all elements in the array are non-negative integers and fit in the 32-bit signed integer range.
 Try to solve it in linear time/space.
 ***/



class Solution164x1 {
    func maximumGap(_ nums: [Int]) -> Int {
        var maxGap = 0
        if nums.count < 2 { return maxGap }
        
        var start = 0
        let sortedArray = nums.sorted()
        while (start < sortedArray.count - 1) {
            let diff = sortedArray[start + 1] - sortedArray[start]
            maxGap = max(diff, maxGap)
            start += 1
        }
        
        return maxGap
    }
}


class Solution164x2 {
    func maximumGap(_ nums: [Int]) -> Int {
        if nums.isEmpty || nums.count == 1 {return 0}
        var nums: [Int] = nums.sorted(by:<)
        var ret:Int = 0
        for i in 1..<nums.count
        {
            ret = max(ret, nums[i]-nums[i-1])
        }
        return ret
    }
}



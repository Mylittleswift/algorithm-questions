/***
 152. Maximum Product Subarray
 Medium

 Given an integer array nums, find the contiguous subarray within an array (containing at least one number) which has the largest product.
 
 Example 1:
 
 Input: [2,3,-2,4]
 Output: 6
 Explanation: [2,3] has the largest product 6.
 Example 2:
 
 Input: [-2,0,-1]
 Output: 0
 Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
 ***/



class Solution152x1 {
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        var minValue = nums[0], maxValue = nums[0], finalValue = nums[0]
        
        for i in 1..<nums.count {
            if nums[i] > 0 {
                maxValue = max(nums[i], maxValue * nums[i])
                minValue = min(nums[i], minValue * nums[i])
            }else {
                var tmp = maxValue
                maxValue = max(nums[i], minValue * nums[i])
                minValue = min(nums[i], tmp * nums[i])
            }
            finalValue = max(finalValue, maxValue)
        }
        
        return finalValue
    }
}


class Solution152x2 {
    func maxProduct(_ nums: [Int]) -> Int {
        return getResult(nums)
    }
    
    private func getResult(_ array: [Int]) -> Int {
        var result = array[0]
        var previousMin = array[0]
        var previousMax = array[0]
        var currentMin = array[0]
        var currentMax = array[0]
        
        for el in array.dropFirst() {
            currentMax = max(max(previousMax * el, previousMin * el), el)
            currentMin = min(min(previousMax * el, previousMin * el), el)
            result = max(currentMax, result)
            previousMax = currentMax
            previousMin = currentMin
        }
        
        return result
    }
}


class Solution152x3 {
    func maxProduct(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var ret = nums.first!
        var (iMin, iMax) = (nums.first!, nums.first!)
        
        for n in nums.dropFirst() {
            if n < 0 {
                (iMin, iMax) = (iMax, iMin)
            }
            
            iMin = min(n, iMin * n)
            iMax = max(n, iMax * n)
            
            ret = max(ret, iMax)
        }
        
        return ret
    }
}


class Solution152x4 {
    
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        var minimum = 1
        var maximum = 1
        var oldMax = maximum
        var globalMax = nums[0]
        
        for num in nums {
            if num < 0 {
                oldMax = maximum
                maximum = max(num, minimum*num)
                minimum = min(num, oldMax*num)
            } else {
                maximum = max(num, maximum*num)
                minimum = min(num, minimum*num)
            }
            globalMax = max(globalMax, maximum)
        }
        
        return globalMax
    }
}


class Solution152x5 {
    func maxProduct(_ nums: [Int]) -> Int {
        var lhs = 1
        var rhs = 1
        var maxhs = nums[0]
        
        for i in 0..<nums.count {
            lhs *= nums[i]
            rhs *= nums[nums.count - i - 1]
            maxhs = max(maxhs, lhs, rhs)
            
            if lhs == 0 { lhs = 1}
            if rhs == 0 { rhs = 1}
            
        }
        return maxhs
    }
}

/***
 239. Sliding Window Maximum
 Hard

 Given an array nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position. Return the max sliding window.
 
 Follow up:
 Could you solve it in linear time?
 
 Example:
 
 Input: nums = [1,3,-1,-3,5,3,6,7], and k = 3
 Output: [3,3,5,5,6,7]
 Explanation:
 
 Window position                Max
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
 1 [3  -1  -3] 5  3  6  7       3
 1  3 [-1  -3  5] 3  6  7       5
 1  3  -1 [-3  5  3] 6  7       5
 1  3  -1  -3 [5  3  6] 7       6
 1  3  -1  -3  5 [3  6  7]      7
 ***/



class Solution239x1 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard k > 0 && nums.count >= k else {
            return []
        }
        
        if k == 1 {
            return nums
        }
        var res = [Int]()
        var max_tuple = (nums[0],0)
        
        for i in 0..<k {
            if nums[i] > max_tuple.0 {
                max_tuple = (nums[i],i)
            }
        }
        res.append(max_tuple.0)
        for i in k..<nums.count {
            
            if nums[i] > max_tuple.0 {
                max_tuple = (nums[i],i)
            } else if max_tuple.1 == (i-k){
                var pos = max_tuple.1
                max_tuple = (nums[i],i)
                for j in (pos + 1)...(i-1) {
                    if nums[j] > max_tuple.0 {
                        max_tuple = (nums[j],j)
                    }
                }
            }
            res.append(max_tuple.0)
        }
        
        return res
    }
}


class Solution239x2 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count > 0 && k > 0 else { return [] }
        var i = 0
        var maxWindow = [Int]()
        while k + i <= nums.count {
            let slice = nums[i..<i+k]
            if maxWindow.count == 0 {
                maxWindow.append(slice.max()!)
            } else {
                let lastMax = maxWindow.last!
                if lastMax == nums[i - 1] {
                    maxWindow.append(slice.max()!)
                } else {
                    maxWindow.append(max(lastMax, slice.last!))
                }
            }
            
            i += 1
        }
        return maxWindow
    }
}


class Solution239x3 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.isEmpty || k <= 0 {
            return []
        }
        var window: [Int] = [], res: [Int] = []
        for i in 0..<nums.count {
            let x = nums[i]
            if i >= k && window[0] <= i - k {
                window.removeFirst()
            }
            while !window.isEmpty && nums[window.last!] <= x {
                window.popLast()
            }
            window.append(i)
            if i >= k - 1 {
                res.append(nums[window.first!])
            }
        }
        return res
    }
}

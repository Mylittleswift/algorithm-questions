/***
 220. Contains Duplicate III
 Medium

 Given an array of integers, find out whether there are two distinct indices i and j in the array such that the absolute difference between nums[i] and nums[j] is at most t and the absolute difference between i and j is at most k.
 
 Example 1:
 
 Input: nums = [1,2,3,1], k = 3, t = 0
 Output: true
 Example 2:
 
 Input: nums = [1,0,1,1], k = 1, t = 2
 Output: true
 Example 3:
 
 Input: nums = [1,5,9,1,5,9], k = 2, t = 3
 Output: false
 ***/



class Solution220x1 {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        var set: Set<Int> = []
        for (index, num) in nums.enumerated() {
            if t == 0 {
                if set.contains(num) {
                    return true
                }
            } else {
                if set.contains(where: { abs($0 - num) <= t }) {
                    return true
                }
            }
            
            set.insert(num)
            
            if index >= k {
                set.remove(nums[index - k])
            }
        }
        
        return false
    }
}


class Solution220x2 {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        if nums.isEmpty || nums.count < 2 {
            return false
        }
        var indices = [Int](0 ..< nums.count)
        indices = indices.sorted(by: { a, b in nums[a] < nums[b] } )
        
        for i in 0 ..< nums.count {
            var x = indices[i]
            for j in (i + 1) ..< nums.count {
                var y = indices[j]
                var diffNums = nums[y] - nums[x]
                var diffIndex = abs(x - y)
                if diffNums > t {
                    break
                }
                if diffIndex <= k {
                    return true
                }
            }
        }
        return false
    }
}


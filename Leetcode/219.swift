/***
 219. Contains Duplicate II
 Easy

 Given an array of integers and an integer k, find out whether there are two distinct indices i and j in the array such that nums[i] = nums[j] and the absolute difference between i and j is at most k.
 
 Example 1:
 
 Input: nums = [1,2,3,1], k = 3
 Output: true
 Example 2:
 
 Input: nums = [1,0,1,1], k = 1
 Output: true
 Example 3:
 
 Input: nums = [1,2,3,1,2,3], k = 2
 Output: false
 ***/


class Solutionw219x1 {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        //判断
        if nums == nil || nums.count < 2 || k < 1
        {
            return false
        }
        var map:[Int:Int] = [Int:Int]()
        for i in 0..<(nums.count)
        {
            if map.keys.contains(nums[i])
            {
                var sub:Int = i - map[nums[i]]!
                if sub <= k
                {
                    return true
                }
                else
                {
                    map[nums[i]] = i
                }
            }
            else
            {
                map[nums[i]] = i
            }
        }
        return false
    }
}


class Solution219x2 {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var set = Set<Int>()
        for i in 0..<nums.count {
            if i > k { set.remove(nums[i - k - 1]) }
            if !set.insert(nums[i]).inserted { return true }
        }
        return false
    }
}


class Solution219X3 {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var set = Set<Int>()
        
        for i in 0..<nums.count {
            if i > k {
                set.remove(nums[i - k - 1])
            }
            if !set.insert(nums[i]).inserted {
                return true
            }
        }
        
        return false
    }
}

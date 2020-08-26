/***
 217. Contains Duplicate
 Easy

 Given an array of integers, find if the array contains any duplicates.
 
 Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
 
 Example 1:
 
 Input: [1,2,3,1]
 Output: true
 Example 2:
 
 Input: [1,2,3,4]
 Output: false
 Example 3:
 
 Input: [1,1,1,3,3,4,3,2,4,2]
 Output: true
 ***/



class Solution217x1 {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return Set(nums).count != nums.count
    }
}


class Solution217x2 {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        
        if nums.count == 0 {
            return false
        }
        
        var dict: Set<Int> = Set()
        
        for item in nums {
            dict.insert(item)
        }
        
        if dict.count < nums.count {
            return true
        }
        
        
        return false
    }
}


class Solution217x3 {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else {
            return false
        }
        var  set = Set([Int]())
        for num in nums {
            if set.contains( num) {
                return true
            } else {
                set.insert(num)
            }
        }
        return false
    }
}

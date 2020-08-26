/***
 229. Majority Element II
 Medium

 Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.
 
 Note: The algorithm should run in linear time and in O(1) space.
 
 Example 1:
 
 Input: [3,2,3]
 Output: [3]
 Example 2:
 
 Input: [1,1,1,3,3,2,2,2]
 Output: [1,2]
 ***/


class Solution229x1 {
    func majorityElement(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        var majorA = nums[0]
        var countA = 0
        
        var majorB = nums[0]
        var countB = 0
        
        for index in 0...(nums.count-1) {
            if nums[index] == majorA {
                countA += 1
                continue
            }
            
            if nums[index] == majorB {
                countB += 1
                continue
            }
            
            if countA == 0 {
                majorA = nums[index]
                countA += 1
                continue
            }
            
            if countB == 0 {
                majorB = nums[index]
                countB += 1
                continue
            }
            
            countA -= 1
            countB -= 1
        }
        
        countA = 0
        countB = 0
        for index in 0...(nums.count - 1) {
            if nums[index] == majorA {
                countA += 1
            } else if nums[index] == majorB {
                countB += 1
            }
        }
        
        var result = [Int]()
        if countA > nums.count/3 {
            result.append(majorA)
        }
        if countB > nums.count/3 {
            result.append(majorB)
        }
        
        return result
    }
}


class Solution229x2 {
    func majorityElement(_ nums: [Int]) -> [Int] {
        
        var res = [Int]()
        var cm = 0, cn = 0, m = 0, n = 0
        for a in nums {
            if a == m { cm += 1 }
            else if a == n { cn += 1 }
            else if cm == 0 { m = a; cm = 1}
            else if cn == 0 { n = a; cn = 1 }
            else { cm -= 1; cn -= 1}
        }
        cm = 0; cn = 0
        for a in nums {
            if a == m { cm += 1 }
            else if a == n { cn += 1 }
        }
        if cm > nums.count / 3 {res.append(m)}
        if cn > nums.count / 3 {res.append(n)}
        return res
    }
}


class Solution229x3 {
    func majorityElement(_ nums: [Int]) -> [Int] {
        var elems: [Int: Int] = [:]
        for n in nums {
            elems[n, default: 0] +=  1
        }
        return elems.compactMap { key, value in
            if value > nums.count / 3 { return key }
            return nil
        }
    }
}

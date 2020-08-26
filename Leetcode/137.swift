/***
 137. Single Number II
 Medium

 Given a non-empty array of integers, every element appears three times except for one, which appears exactly once. Find that single one.
 
 Note:
 
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 Example 1:
 
 Input: [2,2,3,2]
 Output: 3
 Example 2:
 
 Input: [0,1,0,1,0,1,99]
 Output: 99
 ***/



class Solution137x1 {
    func singleNumber(_ nums: [Int]) -> Int {
        let count = nums.count
        guard count > 0 else { return 0 }
        let range = 1..<count
        var oneTime = nums[0]
        var twoTimes = 0
        var notThreeTimes = 0
        for i in range {
            let next = nums[i]
            twoTimes |= oneTime & next
            oneTime ^= next
            notThreeTimes = ~(oneTime & twoTimes)
            oneTime &= notThreeTimes
            twoTimes &= notThreeTimes
        }
        return oneTime
    }
}


class Solution137x2 {
    func singleNumber(_ nums: [Int]) -> Int {
        var a = 0, b = 0;
        for num in nums {
            b = (b ^ num) & ~a;
            a = (a ^ num) & ~b;
        }
        return b;
    }
}


class Solution137x3 {
    func singleNumber(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        var temp = [Int: Int]()
        
        for num in nums {
            temp[num] = temp[num, default: 0] + 1
        }
        
        for key in temp.keys {
            if temp[key]! == 1 {
                return key
            }
        }
        
        return 0
    }
}


class Solution137x4 {
    func singleNumber(_ nums: [Int]) -> Int {
        var resSet = Set<Int>(nums)
        var showed = Set<Int>()
        for num in nums {
            if showed.contains(num) {
                resSet.remove(num)
            }
            showed.insert(num)
        }
        return resSet.first!
    }
}


class Solution137x5 {
    func singleNumber(_ nums: [Int]) -> Int {
        var numDict = [Int: Int]()
        for num in nums {
            if let value = numDict[num] {
                numDict[num] = value + 1
            } else {
                numDict[num] = 1
            }
        }
        
        let singleVal = numDict.filter { $0.value == 1 }.first!
        return singleVal.key
    }
}


class Solution137x6 {
    func singleNumber(_ nums: [Int]) -> Int {
        return ((Set(nums).reduce(0,+) * 3) - nums.reduce(0,+))/2
    }
}

/***
 202. Happy Number
 Easy

 Write an algorithm to determine if a number n is "happy".
 
 A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.
 
 Return True if n is a happy number, and False if not.
 
 Example:
 
 Input: 19
 Output: true
 Explanation:
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1
 ***/



class Solution202x1 {
    func isHappy(_ n: Int) -> Bool {
        var fast = n
        var slow = n
        fast = sumOfSquares(fast)
        fast = sumOfSquares(fast)
        slow = sumOfSquares(slow)
        while fast != slow {
            fast = sumOfSquares(fast)
            fast = sumOfSquares(fast)
            slow = sumOfSquares(slow)
        }
        return slow == 1
        
    }
    
    func sumOfSquares(_ n: Int) -> Int {
        var num = n
        var sum = 0
        while num > 0 {
            let value = num%10
            sum += value*value
            num /= 10
        }
        return sum
    }
}


class Solution202x2 {
    func isHappy(_ n: Int) -> Bool {
        var hasOccurredMap = Dictionary<Int, Bool>()
        return isHappy(n, &hasOccurredMap)
    }
    
    private func isHappy(
        _ n: Int,
        _ hasOccurredMap: inout Dictionary<Int, Bool>) -> Bool {
        guard n != 1 else { return true }
        guard hasOccurredMap[n] == nil else { return false }
        var m = 0
        var temp = n
        while temp > 0 {
            let digit = temp % 10
            temp /= 10
            m += digit * digit
        }
        hasOccurredMap[n] = true
        return isHappy(m, &hasOccurredMap)
    }
}


class Solution202x3 {
    func isHappy(_ n: Int) -> Bool {
        var nT = n
        
        while (nT != 1 && nT != 4) {
            var t = 0
            while (nT>0) {
                t += (nT % 10) * (nT % 10)
                nT /= 10
            }
            nT = t
        }
        return nT == 1
    }
}


class Solution202x4 {
    func isHappy(_ n: Int) -> Bool {
        var prevSums: Set<Int> = Set()
        var curr = n
        while curr != 1 {
            if prevSums.contains(curr) {
                return false
            }
            prevSums.insert(curr)
            let digits: [Int] = String(curr).compactMap { Int(String($0)) }
            var newSum = 0
            for digit in digits {
                newSum += (digit * digit)
            }
            curr = newSum
        }
        return true
    }
}



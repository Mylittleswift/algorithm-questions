/***
 258. Add Digits
 Easy

 Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.
 
 Example:
 
 Input: 38
 Output: 2
 Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2.
 Since 2 has only one digit, return it.
 Follow up:
 Could you do it without any loop/recursion in O(1) runtime?
 ***/



class Solution258x1 {
    func addDigits(_ num: Int) -> Int {
        return (num - 1)%9 + 1
    }
}


class Solution258x2 {
    func addDigits(_ num: Int) -> Int {
        var num = num
        
        while num >= 10 {
            var x = 0
            while num > 0 {
                x += num % 10
                num /= 10
            }
            num = x
        }
        
        return num
    }
}



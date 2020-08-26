/***
 29. Divide Two Integers
 Medium
 
 Given two integers dividend and divisor, divide two integers without using multiplication, division and mod operator.
 
 Return the quotient after dividing dividend by divisor.
 
 The integer division should truncate toward zero, which means losing its fractional part. For example, truncate(8.345) = 8 and truncate(-2.7335) = -2.
 
 Example 1:
 
 Input: dividend = 10, divisor = 3
 Output: 3
 Explanation: 10/3 = truncate(3.33333..) = 3.
 Example 2:
 
 Input: dividend = 7, divisor = -3
 Output: -2
 Explanation: 7/-3 = truncate(-2.33333..) = -2.
 Note:
 
 Both dividend and divisor will be 32-bit signed integers.
 The divisor will never be 0.
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 231 − 1 when the division result overflows.
 ***/

//LC PASSED
class Solution29x3 {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if divisor == 0 {
            return Int.max - 1
        }
        let isNegative = (dividend < 0) != (divisor < 0)
        var dividend = abs(dividend)
        let divisor = abs(divisor)
        var count = 0
        
        while dividend >= divisor {
            var shift = 0
            while dividend >= (divisor << shift) {
                shift += 1
            }
            dividend -= divisor << (shift - 1)
            count += 1 << (shift - 1)
        }
        if count >= 2147483648 && !isNegative {
            return 2147483647
        }
        return isNegative ? -count : count
    }
}


class Solution29x4 {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let isNegative = (dividend > 0 && divisor < 0) || (dividend < 0 && divisor > 0)
        guard dividend != divisor else { return 1 }
        guard dividend != 0 else { return 0 }
        var y = abs(divisor)
        var x = abs(dividend)
        if dividend == Int(Int32.max), y == 1 {
            return isNegative ? -Int(Int32.max) : dividend
        }
        if dividend == Int(Int32.min), y == 1 {
            return isNegative ? Int(Int32.min) : Int(Int32.max)
        }
        guard y != x else { return -1 }
        var count = 0
        while (x > y) {
            var i = 1
            var j = 0
            while (x >= y << 1) {
                y = y << 1
                i = i << 1
                j += 1
            }
            x -= y
            y = y >> j
            count += i
        }
        return isNegative ? -count : count
    }
}

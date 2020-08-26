/***
 233. Number of Digit One
 Hard

 Given an integer n, count the total number of digit 1 appearing in all non-negative integers less than or equal to n.
 
 Example:
 
 Input: 13
 Output: 6
 Explanation: Digit 1 occurred in the following numbers: 1, 10, 11, 12, 13.
 ***/



class Solution233x1 {
    func countDigitOne(_ n: Int) -> Int {
        var     n = n
        var  rest = 0
        var  base = 1
        var count = 0
        
        while n > 0 {
            let digit = n % 10
            n = n/10
            count += n * base
            switch digit {
            case 0: ()
            case 1: count += rest + 1
            default: count += base
            }
            rest = digit * base + rest
            base *= 10
        }
        return count
    }
}


class Solution233x2 {
    func countDigitOne(_ n: Int) -> Int {
        var num = n
        var res = 0
        var multiply = 1
        var remainder = 0
        while num > 0 {
            let val = num % 10
            
            if val <= 1 {
                res += (num / 10) * multiply
                if val == 1 {
                    res += remainder + 1
                }
            }
            else {
                res += (num / 10 + 1) * multiply
            }
            
            multiply *= 10
            remainder = n % multiply
            num /= 10
        }
        
        return res
    }
}


class Solution233x3 {
    func countDigitOne(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        
        if n < 10 {
            return 1
        }
        
        var m = n
        var l = 0
        var c = 1
        while m != 0 {
            l = m % 10
            m /= 10
            c *= 10
        }
        c /= 10
        let k = l * c
        
        if l == 1 {
            return n - k + 1 + countDigitOne(n-k) + countDigitOne(c-1)
        }else {
            return countDigitOne(2 * c - 1) + (l - 2)*countDigitOne(c-1) + countDigitOne(n-k)
        }
    }
}

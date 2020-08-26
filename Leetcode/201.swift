/***
 201. Bitwise AND of Numbers Range
 Medium

 Given a range [m, n] where 0 <= m <= n <= 2147483647, return the bitwise AND of all numbers in this range, inclusive.
 
 Example 1:
 
 Input: [5,7]
 Output: 4
 Example 2:
 
 Input: [0,1]
 Output: 0
 ***/


class Solution201x1 {
    func topDigit(_ n: Int) -> Int {
        var n = n
        while (n & (n-1)) != 0 {
            n = (n & (n-1))
        }
        return n
    }
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        guard m > 0 && n > 0 else {
            return 0
        }
        var m2 = topDigit(m)
        var n2 = topDigit(n)
        
        if n2 != m2 {
            return 0
        }
        
        return m2 | rangeBitwiseAnd(m-m2, n-m2)
    }
}


class Solution201x2 {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        if m == 0 {
            return 0
        }
        
        var m = m
        var n = n
        var factor = 1
        
        while m != n {
            m >>= 1
            n >>= 1
            factor <<= 1
        }
        
        return m * factor
    }
}


class Solution201x3 {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        /*
         0  - 0000
         1  - 0001
         2  - 0010
         3  - 0011
         4  - 0100
         5  - 0101
         6  - 0110
         7  - 0111
         8  - 1000
         9  - 1001
         10 - 1010
         
         8..10  =>  1000
         */
        
        var m = m
        var n = n
        var i = 0
        while m != n {
            m >>= 1
            n >>= 1
            i += 1
        }
        return m << i
    }
}


class Solution201x4 {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        return (n > m) ? (rangeBitwiseAnd(m / 2, n / 2) << 1) : m
        
    }
}


class Solution201x5 {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        var plus = 1
        var result = m & n
        while m + plus < n {
            result &= m + plus
            plus += plus
        }
        return result
    }
}

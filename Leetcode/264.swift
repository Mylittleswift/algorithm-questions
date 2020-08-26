/***
 264. Ugly Number II
 Medium

 Write a program to find the n-th ugly number.
 
 Ugly numbers are positive numbers whose prime factors only include 2, 3, 5.
 
 Example:
 
 Input: n = 10
 Output: 12
 Explanation: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 is the sequence of the first 10 ugly numbers.
 Note:
 
 1 is typically treated as an ugly number.
 n does not exceed 1690.
 ***/



class Solution264x1 {
    func nthUglyNumber(_ n: Int) -> Int {
        if n == 1 { return 1}
        var val1 = 2
        var val2 = 3
        var val3 = 5
        var i1 = 0
        var i2 = 0
        var i3 = 0
        var result = [1]
        for i in 1 ..< n {
            let current = min(min(val1, val2), val3)
            result.append(current)
            if current == val1 {
                i1 += 1
                val1 = result[i1] * 2
            }
            if current == val2 {
                i2 += 1
                val2 = result[i2] * 3
            }
            if current == val3 {
                i3 += 1
                val3 = result[i3] * 5
            }
        }
        return result[n - 1]
    }
}


class Solution264x2 {
    func nthUglyNumber(_ n: Int) -> Int{
        
        var res = [1]
        var i2 = 0, i3 = 0, i5 = 0
        while res.count < n {
            let m2 = res[i2]*2, m3 = res[i3]*3, m5 = res[i5]*5
            let mn = min(min(m2, m3), m5)
            if m2 == mn { i2 += 1 }
            if m3 == mn { i3 += 1 }
            if m5 == mn { i5 += 1 }
            res.append(mn)
        }
        return res.last!
    }
}



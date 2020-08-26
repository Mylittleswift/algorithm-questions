/***
 50. Pow(x, n)
 Medium

 Implement pow(x, n), which calculates x raised to the power n (xn).
 
 Example 1:
 
 Input: 2.00000, 10
 Output: 1024.00000
 Example 2:
 
 Input: 2.10000, 3
 Output: 9.26100
 Example 3:
 
 Input: 2.00000, -2
 Output: 0.25000
 Explanation: 2-2 = 1/22 = 1/4 = 0.25
 Note:
 
 -100.0 < x < 100.0
 n is a 32-bit signed integer, within the range [−231, 231 − 1]
 ***/

class Solution50x1 {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        let temp = myPow(x, n/2)
        if n % 2 == 0 {
            return temp * temp
        } else {
            if n > 0 {
                return x * temp * temp
            } else {
                return (temp * temp)/x
            }
        }
    }
}


class Solution50x2 {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n < 0 {
            return 1 / power(x, -n);
        } else {
            return power(x, n);
        }
    }
    private func power(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        let v = power(x, n / 2)
        if n % 2 == 0 {
            return v * v
        } else {
            return v * v * x
        }
    }
}


class Solution50x4 {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        if n < 0 {
            return myPow(1/x, -n)
        }
        return n % 2 == 0 ? myPow(x * x , n / 2) : x * myPow(x*x, n / 2)
    }
}

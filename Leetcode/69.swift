/***n
 69. Sqrt(x)
 Easy

 Implement int sqrt(int x).
 
 Compute and return the square root of x, where x is guaranteed to be a non-negative integer.
 
 Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.
 
 Example 1:
 
 Input: 4
 Output: 2
 Example 2:
 
 Input: 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since
 the decimal part is truncated, 2 is returned.
 ***/


class Solution69x1 {
    func mySqrt(_ x: Int) -> Int {
        //二分法
        var low:Int = 1
        var high:Int = x
        while(low <= high)
        {
            var mid = (low+high)/2
            //乘法会导致溢出，应写成除法
            if mid == x/mid
            {
                return mid
            }
            else
            {
                if mid < x/mid
                {
                    low = mid + 1
                }
                else
                {
                    high = mid - 1
                }
            }
        }
        return low-1
    }
}


class Solution69x2 {
    func mySqrt(_ x: Int) -> Int {
        //牛顿迭代法
        //判断x是否为0
        if x == 0 {return 0}
        var low:Double = 1.0
        var high:Double = Double(x)
        var mid:Double = high/2
        var y:Double = (mid>1) ? mid : 1
        while(true)
        {
            var dy:Double = (y * y + high) / Double(y)/2
            //处理int类型的取绝对值abs(int i)
            //处理double类型的取绝对值fabs(double i)
            //处理float类型的取绝对值fabsf(float i)
            if abs(y - dy)<=0.01
            {
                return Int(dy)
            }
            else
            {
                y = dy
            }
        }
    }
}


class Solution69x3 {
    func mySqrt(_ x: Int) -> Int {
        guard x > 1 else { return x }
        var left = 0
        var right = x
        while left <= right {
            let mid = (left + right) / 2
            if mid*mid > x {
                right = mid - 1
            }
            else {
                left = mid + 1
            }
        }
        return right
    }
}

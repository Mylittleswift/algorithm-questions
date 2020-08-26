/***
 172. Factorial Trailing Zeroes
 Easy

 Given an integer n, return the number of trailing zeroes in n!.
 
 Example 1:
 
 Input: 3
 Output: 0
 Explanation: 3! = 6, no trailing zero.
 Example 2:
 
 Input: 5
 Output: 1
 Explanation: 5! = 120, one trailing zero.
 ***/



class Solution172x1 {
    func trailingZeroes(_ n: Int) -> Int {
        //该数应为x*10k 的形式等于x*（2k *5k）
        //即求该数分解质因子后有几个5
        var num = n
        var sum:Int = 0
        while(num > 0)
        {
            num /= 5
            sum += num
        }
        return sum
    }
}


class Solution172x2 {
    func trailingZeroes(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        
        return (n / 5) + trailingZeroes(n / 5)
    }
}

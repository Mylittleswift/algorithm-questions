/***
 70. Climbing Stairs
 Easy

 You are climbing a stair case. It takes n steps to reach to the top.
 
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 
 Note: Given n will be a positive integer.
 
 Example 1:
 
 Input: 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 Example 2:
 
 Input: 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
 ***/


class Solution70x1 {
    func climbStairs(_ n: Int) -> Int {
        //动态规划
        //把运算的结果保存下来
        //下一次运算时直接调用
        if n==1 || n==2 {return n}
        //创建一个特定大小的数组
        //并将其所有值设置为相同的默认值
        var arr:[Int] = Array(repeating: 0 , count: n+1)
        //斐波那契数列
        //递归方式会时很多运算时重复,导致运算时间超时
        arr[1] = 1
        arr[2] = 2
        for i in 3...n
        {
            arr[i] =  arr[i-1] + arr[i-2]
        }
        return arr[n]
    }
}


class Solution70x2 {
    func climbStairs(_ n: Int) -> Int {
        if n < 3 {
            return n
        }
        
        var a = 1
        var b = 2
        var res = 0
        
        for _ in 2..<n {
            res = a + b
            a = b
            b = res
        }
        
        return res
    }
}


class Solution70x3 {
    func climbStairs(_ n: Int) -> Int
    {
        guard n != 1 else { return 1 }
        
        var stairCount = [Int]()
        stairCount.insert(0, at: 0)
        stairCount.insert(1, at: 1)
        stairCount.insert(2, at: 2)
        if n > 2
        {
            for i in 3...n
            {
                stairCount.append(stairCount[i - 1] + stairCount[i - 2])
            }
        }
        return stairCount[n]
    }
}


class Solution70x4 {
    func climbStairs(_ n: Int) -> Int {
        var result = 0
        var n1 = 3
        var n2 = 2
        
        if n <= 3 {
            result = n
        } else {
            for _ in 3..<n {
                result = n1 + n2
                n2 = n1
                n1 = result
            }
        }
        
        return result
    }
}


class Solution70x5 {
    func climbStairs(_ n: Int) -> Int {
        if(n < 2){return 1}
        var memo = [Int]()
        memo.append(1)
        memo.append(1)
        for i in 2...n{memo.append(memo[i-1] + memo[i-2])}
        return memo.last ?? memo[0]
    }
}


//  问题分析：动态规划，f[i]表示第i阶的方法数，f[i] = f[i - 1] + 1 + f[i - 2] + 1

class Solution70x6 {
    func climbStairs(_ n: Int) -> Int {
        var f: [Int] = []
        f.append(1)
        for i in 1...n {
            var one = f[i - 1]
            var two = 0
            if (i - 2 < 0) {
                two = 0
            } else {
                two = f[i - 2]
            }
            f.append(one + two)
        }
        return f[n]
    }
}

/***
 254 Factor Combinations
 Medium
 
 Problem:
 Numbers can be regarded as product of its factors. For example,
 
 8 = 2 x 2 x 2;
 = 2 x 4.
 
 Write a function that takes an integer n and return all possible combinations of its factors.
 
 Note:
 You may assume that n is always positive.
 Factors should be greater than 1 and less than n.
 
 Examples:
 input: 1
 output:
 []
 input: 37
 output:
 []
 input: 12
 output:
 [
 [2, 6],
 [2, 2, 3],
 [3, 4]
 ]
 input: 32
 output:
 [
 [2, 16],
 [2, 2, 8],
 [2, 2, 2, 4],
 [2, 2, 2, 2, 2],
 [2, 4, 4],
 [4, 8]
 ]
 ***/



class Solution254 {
    func getFactors(_ n:Int) -> [[Int]]{
        var res:[[Int]] = [[Int]]()
        var arr:[Int] = [Int]()
        helper(n,2,&arr,&res)
        return res
    }
    
    func helper(_ n:Int,_ start:Int,_ out:inout [Int],_ res:inout [[Int]])
    {
        var num:Int = Int(floor(sqrt(Double(n))))
        var i :Int = start
        while(i <= num)
        {
            if n % i == 0
            {
                var new_out:[Int] = out
                new_out.append(i)
                helper(n / i, i, &new_out, &res)
                new_out.append(n / i)
                res.append(new_out)
            }
            i += 1
        }
    }
}

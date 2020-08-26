/***
 89. Gray Code
 Medium

 The gray code is a binary numeral system where two successive values differ in only one bit.
 
 Given a non-negative integer n representing the total number of bits in the code, print the sequence of gray code. A gray code sequence must begin with 0.
 
 Example 1:
 
 Input: 2
 Output: [0,1,3,2]
 Explanation:
 00 - 0
 01 - 1
 11 - 3
 10 - 2
 
 For a given n, a gray code sequence may not be uniquely defined.
 For example, [0,2,3,1] is also a valid gray code sequence.
 
 00 - 0
 10 - 2
 11 - 3
 01 - 1
 Example 2:
 
 Input: 0
 Output: [0]
 Explanation: We define the gray code sequence to begin with 0.
 A gray code sequence of n has size = 2n, which for n = 0 the size is 20 = 1.
 Therefore, for n = 0 the gray code sequence is [0].
 ***/



class Solution89x1 {
    func grayCode(_ n: Int) -> [Int] {
        var result = [Int]()
        var i: Int = 0
        while i < (1 << n) {
            result.append( i ^ (i >> 1))
            i += 1
        }
        return result
    }
}


class Solution89x2 {
    func grayCode(_ n: Int) -> [Int] {
        var result = [Int]()
        for i in 0..<1 << n {
            result.append((i >> 1) ^ i)
        }
        return result
    }
}


class Solution89x3 {
    func grayCode(_ number: Int) -> [Int] {
        guard number > 0 else {
            return [0]
        }
        var result: [Int] = [0, 1]
        for idx in 1..<number {
            for iidx in (0...result.count - 1).reversed() {
                result.append(result[iidx] + 1 << idx)
            }
        }
        return result
    }
}


class Solution89x4 {
    func grayCode(_ n: Int) -> [Int] {
        if n == 0 {
            return [0]
        }
        
        if n == 1 {
            return [0, 1]
        }
        
        var res = [0, 1]
        
        for i in 1..<n {
            var result: [Int] = []
            for val in res.reversed() {
                result.append(val + (1<<i))
            }
            res = res + result
        }
        
        return res
    }
}

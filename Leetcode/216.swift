/***
 216. Combination Sum III
 Medium

 Find all possible combinations of k numbers that add up to a number n, given that only numbers from 1 to 9 can be used and each combination should be a unique set of numbers.
 
 Note:
 
 All numbers will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:
 
 Input: k = 3, n = 7
 Output: [[1,2,4]]
 Example 2:
 
 Input: k = 3, n = 9
 Output: [[1,2,6], [1,3,5], [2,3,4]]
 ***/



class Solution216x1 {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        guard k > 0, n > 0  else {
            return [[Int]]()
        }
        
        var result = [[Int]]()
        
        func dfs(index:Int,target:Int, path:[Int]) {
            if target == 0 && path.count == k {
                result.append(path)
                return
            } else if target < 0 || index > 9 || path.count >= k {
                return
            }
            
            for i in index...9 {
                dfs(index:i + 1, target: target - i, path:path + [i])
            }
        }
        dfs(index:1, target:n, path:[Int]())
        
        return result
    }
}


class Solution216x2 {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var res = [[Int]]()
        var temp = [Int]()
        dfs(&res, &temp, n, k, 1)
        return res
    }
    
    private func dfs(_ res: inout [[Int]], _ temp: inout [Int], _ n: Int, _ k: Int, _ index: Int) {
        if n == 0 && k == 0 {
            res.append(Array(temp))
            return
        }
        if n <= 0 || k == 0 || index > 9  {
            return
        }
        for i in index...9 {
            temp.append(i)
            dfs(&res, &temp, n - i, k - 1, i + 1)
            temp.removeLast()
        }
    }
}


class Solution216x3 {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var array = [Int]()
        for i in 1 ... 9 {
            array.append(i)
        }
        
        var result = [[Int]]()
        
        func helper(remain: [Int], current: [Int], sum: Int) {
            var newRemain = remain
            while newRemain.count > 0 {
                let temp = newRemain.removeFirst()
                var newCurrent = current
                newCurrent.append(temp)
                let newSum = sum + temp
                if newSum == n && newCurrent.count == k {
                    result.append(newCurrent)
                } else if newSum > n {
                    continue
                } else {
                    helper(remain: newRemain, current: newCurrent, sum: newSum)
                }
            }
        }
        
        helper(remain: array, current: [Int](), sum: 0)
        return result
    }
}


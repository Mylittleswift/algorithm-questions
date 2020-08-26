/***
 77. Combinations
 Medium

 Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.
 
 Example:
 
 Input: n = 4, k = 2
 Output:
 [
 [2,4],
 [3,4],
 [2,3],
 [1,2],
 [1,3],
 [1,4],
 ]
 ***/



class Solution77x1 {
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        guard n > 0 else {
            return []
        }
        var result : [[Int]] = []
        var nums : [Int] = Array(repeating: 0, count: k)
        combineNext(lastIndex: 1,leftCount: k, numsIndex: 0, result: &result, nums: &nums, maxN: n)
        return result
    }
    private func combineNext(lastIndex:Int,leftCount:Int,numsIndex:Int , result : inout  [[Int]] , nums : inout [Int] , maxN : Int) {
        if leftCount == 0{
            result.append(nums)
            return
        }
        if lastIndex>maxN {
            return
        }
        
        for idx in lastIndex...(maxN-leftCount+1) {
            nums[numsIndex] = idx
            combineNext(lastIndex: idx+1, leftCount: leftCount-1,numsIndex: numsIndex+1, result: &result, nums: &nums, maxN: maxN)
        }
    }
}


class Solution77x2 {
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        guard n > 0 else {
            return []
        }
        var result = [[Int]]()
        helper(1, n, k, [Int](), &result)
        return result
    }
    
    func helper(_ start: Int, _ end: Int, _ k: Int, _ added: [Int], _ result: inout [[Int]]) {
        if k == 0 {
            result.append(added)
            return
        }
        
        for i in start...(end-k+1) {
            var tempAdded = added
            tempAdded.append(i)
            helper(i+1, end, k-1, tempAdded, &result)
        }
    }
}


class Solution77x3 {
    func combineHelper(withResult result: inout [[Int]], usingTemp temp: inout [Int], andStart start: Int, andN n: Int, andK k: Int) {
        
        if (k <= 0) {
            result.append(temp)
            return
        }
        
        for i in start...n {
            if (n - i + 1) >= k {
                temp.append(i)
                combineHelper(withResult: &result, usingTemp: &temp, andStart: i + 1, andN: n, andK: k - 1)
                temp.removeLast()
            }
        }
    }
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result = [[Int]]();
        var temp = [Int]()
        combineHelper(withResult: &result, usingTemp: &temp, andStart: 1, andN: n, andK: k)
        return result
    }
}


class Solution77x4 {
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        guard n > 0 else {
            return []
        }
        var result = [[Int]]()
        helper(1, n, k, [Int](), &result)
        return result
    }
    
    func helper(_ start: Int, _ end: Int, _ k: Int, _ added: [Int], _ result: inout [[Int]]) {
        if k == 0 {
            result.append(added)
        }
        
        if start > end {
            return
        }
        
        for i in start...(end-k+1) {
            var tempAdded = added
            tempAdded.append(i)
            helper(i+1, end, k-1, tempAdded, &result)
        }
    }
}


    class Solution77x5 {
        func combine(_ n: Int, _ k: Int) -> [[Int]] {
            if n < k {
                return []
            }
            var combo: [Int] = []
            var results: [[Int]] = []
            for i in 1...n {
                backtacking(i, n, k, &combo, &results)
            }
            return results
        }
        
        private func backtacking(_ begin: Int, _ end: Int, _ limit: Int, _ combo: inout [Int], _ results: inout [[Int]]) {
            let remains = end - begin + 1
            if combo.count + remains >= limit {
                combo.append(begin)
                if combo.count == limit {
                    results.append(combo)
                } else {
                    for i in 1..<remains {
                        backtacking(begin + i, end, limit, &combo, &results)
                    }
                }
                combo.removeLast()
            }
        }
        
    }

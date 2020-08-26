/***
 40. Combination Sum II
 Medium

 Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
 
 Each number in candidates may only be used once in the combination.
 
 Note:
 
 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:
 
 Input: candidates = [10,1,2,7,6,1,5], target = 8,
 A solution set is:
 [
 [1, 7],
 [1, 2, 5],
 [2, 6],
 [1, 1, 6]
 ]
 Example 2:
 
 Input: candidates = [2,5,2,1,2], target = 5,
 A solution set is:
 [
 [1,2,2],
 [5]
 ]
 ***/

class Solution40x1 {
    var result = [[Int]]()
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var tempCandidates = candidates
        tempCandidates.sort{$0<$1}
        combinationSum(tempCandidates, target, 0, [Int]())
        return result
    }
    
    func combinationSum(_ candidates: [Int], _ target: Int, _ currentInex: Int, _ usdedNums: [Int]) {
        if target <= 0  {
            if target == 0 {
                result.append(usdedNums)
            }
            return
        }
        
        var previousNum = 0
        for i in currentInex..<candidates.count {
            let currentValue = candidates[i]
            if currentValue > target || previousNum == currentValue {
                continue
            }
            var usdedNumsCopy = usdedNums
            usdedNumsCopy.append(currentValue)
            combinationSum(candidates, target-currentValue, i + 1, usdedNumsCopy)
            previousNum = currentValue
        }
    }
}


class Solution40x2 {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var sortNums = candidates.sorted()
        var tmp = [Int]()  // current set for testing
        var rlt = [[Int]]() // the result set
        backtrack(&sortNums, &tmp, 0, target, &rlt)
        return rlt
    }
    // subtrack a num from candidates to find the combination:
    func backtrack(_ nums: inout [Int], _ tmp: inout [Int], _ start:Int, _ tg:Int, _ rlt:inout[[Int]]) {
        if tg==0 { // find one and put into result;
            rlt.append(tmp)
            return
        }
        if start >= nums.count || nums[start] > tg { return } // go on condictions
        for i in start...nums.count-1 {
            if tg < nums[i] { return }
            if i != start && nums[i]==nums[i-1] { continue } // skip the same num been used
            tmp.append(nums[i])
            backtrack(&nums, &tmp, i+1, tg-nums[i], &rlt)
            tmp.removeLast()
        }
    }
}


class Solution40x3 {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var out = [Int]()
        let candidates = candidates.sorted()
        combinationSumDFS(candidates, target, 0, &out, &result)
        return result
    }
    
    func combinationSumDFS(_ candidates: [Int], _ target: Int, _ start: Int, _ out: inout [Int], _ res: inout [[Int]]) {
        if target == 0 {
            res.append(out)
        } else {
            for i in start..<candidates.count {
                if i > start && candidates[i] == candidates[i - 1] {
                    continue
                }
                guard target - candidates[i] >= 0 else {
                    break
                }
                out.append(candidates[i])
                combinationSumDFS(candidates, target - candidates[i], i + 1, &out, &res)
                out.remove(at: out.count - 1)
                
            }
        }
    }
}


class Solution40x4 {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        var currentRes: [Int] = []
        recursionHelper(candidates.sorted(), target, 0, &currentRes, &result)
        return result
    }
    
    func recursionHelper(_ candidates: [Int], _ target: Int, _ index: Int,
                         _ currentRes: inout [Int], _ result: inout [[Int]]) {
        if target == 0 {
            result.append(currentRes)
            return
        }
        if index >= candidates.count {
            return
        }
        
        for idx in index..<candidates.count where target >= candidates[idx] {
            if idx > index && candidates[idx - 1] == candidates[idx] {
                continue
            }
            currentRes.append(candidates[idx])
            recursionHelper(candidates, target - candidates[idx], idx + 1, &currentRes, &result)
            currentRes.removeLast()
        }
    }
}


class Solution40x5 {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var array = candidates.sorted()
        var result = [[Int]]()
        
        func helper(start: Int, temp: [Int], sum: Int) {
            if sum == target {
                result.append(temp)
                return
            }
            if start >= array.count || sum > target {
                return
            }
            for i in start ..< array.count {
                if sum + array[i] > target { return }
                if i != start && array[i] == array[i - 1] { continue }
                var temp = temp
                temp.append(array[i])
                helper(start: i + 1, temp: temp, sum: sum + array[i])
            }
        }
        helper(start: 0, temp: [Int](), sum: 0)
        return result
    }
}


class Solution40x6 {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        var visited: [Bool] = Array(repeating: false, count: candidates.count)
        var currentRes: [Int] = []
        recursionHelper(candidates.sorted(), target, 0, &currentRes, &visited, &result)
        return result
    }
    
    func recursionHelper(_ candidates: [Int], _ target: Int, _ index: Int,
                         _ currentRes: inout [Int], _ visited: inout [Bool], _ result: inout [[Int]]) {
        if target == 0 {
            result.append(currentRes)
            return
        }
        if index >= candidates.count {
            return
        }
        
        for idx in index..<candidates.count where !visited[idx] && target >= candidates[idx] {
            if idx > 0 && candidates[idx - 1] == candidates[idx] && !visited[idx - 1] {
                continue
            }
            currentRes.append(candidates[idx])
            visited[idx] = true
            recursionHelper(candidates, target - candidates[idx], idx + 1, &currentRes, &visited, &result)
            currentRes.removeLast()
            visited[idx] = false
        }
    }
}


class Solution40x7 {
    
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        guard !candidates.isEmpty else { return [] }
        guard target > 0 else { return [[]] }
        
        var results = [[Int]]()
        var tempPath = [Int]()
        let sortedCandidates = candidates.sorted()
        combinationSum(candidates: sortedCandidates, target: target, candidateIndex: -1, results: &results, path: &tempPath)
        return results
    }
    
    func combinationSum(candidates: [Int], target: Int, candidateIndex: Int, results: inout [[Int]], path: inout [Int]) {
        
        if target < 0 { return }
        if target == 0 {
            results.append(path)
            return
        }
        
        for i in (candidateIndex+1..<candidates.count) {
            if candidates[i] > target { continue}
            if i > candidateIndex+1, candidates[i] == candidates[i-1] {
                continue
            }
            path.append(candidates[i])
            combinationSum(candidates: candidates, target: target - candidates[i],
                           candidateIndex: i, results: &results, path: &path)
            path.removeLast()
            
        }
    }
}

/***
 39. Combination Sum
 Medium

 Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
 
 The same repeated number may be chosen from candidates unlimited number of times.
 
 Note:
 
 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:
 
 Input: candidates = [2,3,6,7], target = 7,
 A solution set is:
 [
 [7],
 [2,2,3]
 ]
 Example 2:
 
 Input: candidates = [2,3,5], target = 8,
 A solution set is:
 [
 [2,2,2,2],
 [2,3,3],
 [3,5]
 ]
 ***/


class Solution39x1 {
    var result = [[Int]]()
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        combinationSum(candidates, target, 0, [Int]())
        return result
    }
    
    func combinationSum(_ candidates: [Int], _ target: Int, _ currentIndex: Int, _ usedNums: [Int]) {
        if target < 0  { return }
        if target == 0 {
            result.append(usedNums)
            return
        }
        for i in currentIndex..<candidates.count {
            let currentValue = candidates[i]
            if currentValue > target {
                continue
            }
            var usedNumsCopy = usedNums
            usedNumsCopy.append(currentValue)
            combinationSum(candidates, target-currentValue, i, usedNumsCopy)
        }
    }
}


class Solution39x2 {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let candidatesCopy = candidates.sorted{ $0 < $1 }
        var tmp = [Int]()
        var res = [[Int]]()
        let index = 0
        helper(&tmp, &res, index, candidatesCopy, target)
        return res
    }
    
    private func helper(_ tmp: inout [Int], _ res: inout [[Int]], _ index: Int, _ candidatesCopy: [Int], _ target: Int) {
        if target == 0 {
            res.append(tmp)
            return
        } else if index == candidatesCopy.count {
            return
        }
        for i in index..<candidatesCopy.count {
            if candidatesCopy[i] > target {
                return
            } else if i != index && candidatesCopy[i] == candidatesCopy[i - 1] {
                continue
            }
            tmp.append(candidatesCopy[i])
            helper(&tmp, &res, i, candidatesCopy, target - candidatesCopy[i])
            tmp.removeLast()
        }
    }
}



class Solution39x4 {
    
    var list = [[Int]]()
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let currentlySelected = [Int]()
        recursiveCombSum(candidates: candidates, index: 0, target: target, currentlySelected: currentlySelected)
        return list
    }
    
    func recursiveCombSum(candidates: [Int], index: Int, target: Int, currentlySelected: [Int]) {
        if 0 == target {
            list += [currentlySelected]
        }
        if index == candidates.count {
        } else {
            for i in index..<candidates.count {
                if candidates[i] <= target {
                    let newTarget = target - candidates[i]
                    let newList = currentlySelected + [candidates[i]]
                    recursiveCombSum(candidates: candidates, index: i, target: newTarget, currentlySelected: newList)
                }
            }
        }
    }
}


class Solution39x5 {
    var conbineArray = [[Int]]()
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let count = candidates.count
        guard count > 0 else {
            return [[Int]]()
        }
        combine(candidates, [Int](), count, 0, target)
        return conbineArray
    }
    
    func combine(_ candidates: [Int], _ currentCombine: [Int], _ count: Int, _ index: Int, _ target: Int) {
        if target < 0 { return }
        if index == count { return }
        if target == 0 {
            conbineArray.append(currentCombine)
            return
        }
        combine(candidates, currentCombine, count, index + 1, target)
        var currentCombine = currentCombine
        currentCombine.append(candidates[index])
        combine(candidates, currentCombine, count, index, target - candidates[index])
    }
}

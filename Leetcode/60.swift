/***
 60. Permutation Sequence
 Medium

 The set [1,2,3,...,n] contains a total of n! unique permutations.
 
 By listing and labeling all of the permutations in order, we get the following sequence for n = 3:
 
 "123"
 "132"
 "213"
 "231"
 "312"
 "321"
 Given n and k, return the kth permutation sequence.
 
 Note:
 
 Given n will be between 1 and 9 inclusive.
 Given k will be between 1 and n! inclusive.
 Example 1:
 
 Input: n = 3, k = 3
 Output: "213"
 Example 2:
 
 Input: n = 4, k = 9
 Output: "2314"
 ***/



class Solution60x1 {
    func getPermutation(_ num: Int, _ kth: Int) -> String {
        guard num > 1 else {
            return "1"
        }
        var vals: [Int] = Array(repeating: 1, count: 11)
        var nums: [Int] = Array(repeating: 1, count: 11)
        var kth = kth - 1
        for idx in 0...10 {
            vals[idx] = idx == 0 ? 1 : vals[idx - 1] * (idx + 1)
            nums[idx] = idx + 1
        }
        
        var result = ""
        for idx in (0...num - 2).reversed() {
            let iidx = kth / vals[idx]
            result.append(String(nums[iidx]))
            nums.remove(at: iidx)
            kth %= vals[idx]
        }
        result.append(String(nums[0]))
        return result
    }
}


class Solution60x2 {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        guard n > 0, k > 0 else { return "" }
        if n-1 < 1 {
            return "\(n)"
        }
        
        var arr: [Int] = []
        for i in 1...n {
            arr.append(i)
        }
        
        var factList: [Int] = []
        var current = 1
        for i in 1...n {
            current = current * i
            factList.append(current)
        }
        
        var output = ""
        for i in 1...n-1 {
            var idx = Int((Double((k % factList[n-i])*arr.count)/Double(factList[n-i])).rounded(.up))-1
            if idx < 0 {
                idx += arr.count
            }
            output.append("\(arr.remove(at: idx))")
        }
        output.append("\(arr.removeLast())")
        return output
    }
}


class Solution60x3 {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var k = k
        var j: Int
        var f: Int = 1
        var s = [Character](repeating: "0", count: n)
        let map: [Int: Character] = [1: "1", 2: "2", 3: "3", 4: "4", 5: "5", 6: "6", 7: "7", 8: "8", 9: "9"]
        for i in 1...n {
            f *= i
            s[i-1] = map[i]!
        }
        k -= 1
        for i in 0..<n {
            f /= n - i
            j = i + k / f
            let c = s[j]
            if j > i {
                for m in (i+1...j).reversed() {
                    s[m] = s[m-1]
                }
            }
            k %= f
            s[i] = c
        }
        return String(s)
    }
}


class Solution60x4 {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        if n == 1 { return "1" }
        var array = [Int]()
        var dp = [Int](repeating: 1, count: n + 1)
        for i in 1 ... n {
            array.append(i)
            dp[i] = dp[i - 1] * i
        }
        
        var result = [Int]()
        var k = k
        while result.count < n {
            var i = 0
            while k > (i + 1) * dp[array.count - 1] {
                i += 1
            }
            k = k - i * dp[array.count - 1]
            let temp = array.remove(at: i)
            result.append(temp)
            
        }
        var s = ""
        for i in 0 ..< result.count {
            s += "\(result[i])"
        }
        return s
    }
}



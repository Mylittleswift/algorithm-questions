/***
 91. Decode Ways
 Medium

 A message containing letters from A-Z is being encoded to numbers using the following mapping:
 
 'A' -> 1
 'B' -> 2
 ...
 'Z' -> 26
 Given a non-empty string containing only digits, determine the total number of ways to decode it.
 
 Example 1:
 
 Input: "12"
 Output: 2
 Explanation: It could be decoded as "AB" (1 2) or "L" (12).
 Example 2:
 
 Input: "226"
 Output: 3
 Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
 ***/



class Solution91x1 {
    func numDecodings(_ s: String) -> Int {
        if s.isEmpty || s[s.startIndex] == "0" { return 0 }
        if s.count == 1 { return 1 }
        var count = 1, last = 1
        var i = s.index(after: s.startIndex)
        while i < s.endIndex {
            var cur = 0
            if s[i] > "0" {
                cur += count
            }
            if s[s.index(before: i)] == "1" || (s[s.index(before: i)] == "2" && s[i] <= "6") {
                cur += last
            }
            last = count
            count = cur
            if last == 0 {
                return 0
            }
            i = s.index(after: i)
        }
        return count
    }
}


class Solution91x2 {
    func numDecodings(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        
        let digits = Array(s).map { Int(String($0))! }
        var dp = Array(repeating: 0, count: digits.count + 1)
        dp[0] = 1
        dp[1] = digits[0] == 0 ? 0 : 1
        for i in stride(from: 2, through: digits.count, by: 1) {
            dp[i] += (digits[i - 1] > 0 ? dp[i - 1] : 0)
            let num = digits[i - 2] * 10 + digits[i - 1]
            dp[i] += ((num >= 10 && num <= 26) ? dp[i - 2] : 0)
        }
        
        return dp[digits.count]
    }
}


class Solution91x3 {
    func numDecodings(_ s: String) -> Int {
        guard !s.isEmpty && s.first! != "0" else {
            return 0
        }
        
        if s.count == 1 {
            return 1
        }
        
        var sum: [Int] = [1]
        
        let first = s[s.startIndex]
        let second = s[s.index(after: s.startIndex)]
        if second == "0" && first >= "3" {
            return 0
        }
        
        let str = String(first) + String(second)
        if str == "10" || str == "20" || str > "26" {
            sum.append(1)
        }
        else {
            sum.append(2)
        }
        
        for i in 2..<s.count {
            let index = String.Index(encodedOffset: i)
            let lastIndex = String.Index(encodedOffset: i-1)
            if s[index] == "0" && (s[lastIndex] == "0" || s[lastIndex] >= "3") {
                return 0
            }
            
            if s[index] == "0" {
                sum.append(sum[i-2])
            }
            else {
                if s[lastIndex] == "1" || (s[lastIndex] == "2" && s[index] <= "6") {
                    sum.append(sum[i-1] + sum[i-2])
                }
                else {
                    sum.append(sum[i-1])
                }
            }
        }
        
        return sum.last!
    }
}



class Solution91x4 {
    func numDecodings(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        
        let n = s.count
        var s = s
        var cache = [Int](repeating: -1, count: n + 1)
        cache[n] = 1
        return num(0, &s, &cache)
    }
    
    fileprivate func num(_ i: Int, _ s: inout String, _ cache: inout [Int]) -> Int {
        if cache[i] > -1 {
            return cache[i]
        }
        if s[i] == "0" {
            cache[i] = 0
            return 0
        }
        var res = num(i + 1, &s, &cache)
        if i < s.count - 1 && (s[i] == "1" || s[i] == "2" && s[i + 1] < "7") {
            res += num(i + 2, &s, &cache)
        }
        cache[i] = res
        
        return res
    }
}

//extension String {
//    subscript (i: Int) -> Character {
//        return self[index(startIndex, offsetBy: i)]
//    }
//}

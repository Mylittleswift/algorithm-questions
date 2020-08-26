/***
 28. Implement strStr()
 Easy

 Implement strStr().
 
 Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
 
 Example 1:
 
 Input: haystack = "hello", needle = "ll"
 Output: 2
 Example 2:
 
 Input: haystack = "aaaaa", needle = "bba"
 Output: -1
 Clarification:
 
 What should we return when needle is an empty string? This is a great question to ask during an interview.
 
 For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().
 ***/



class Solution28x3 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else {
            return 0
        }
        let sCount = haystack.count, pCount = needle.count
        guard sCount >= pCount else {
            return -1
        }
        let s = Array(haystack), p = Array(needle)
        var i = 0, j = 0
        while i < s.count && j < p.count {
            if s[i] == p[j] {
                i += 1
                j += 1
            } else {
                i = i - j + 1
                j = 0
            }
        }
        return j == pCount ? i - j : -1
    }
}



class Solution28x5 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty { return 0 }
        let haystackLen = haystack.count
        let needleLen = needle.count
        if haystackLen < needleLen { return -1 }
        for i in 0...haystackLen-needleLen {
            let firstIndex = haystack.index(haystack.startIndex, offsetBy: i)
            let endIndex = haystack.index(haystack.startIndex, offsetBy: i + needleLen)
            let subStr = haystack[firstIndex..<endIndex]
            if subStr == needle {
                return i
            }
        }
        return -1
    }
}



class Solution28x6 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else { return 0 }
        guard needle.count <= haystack.count else { return -1 }
        for i in 0...(haystack.count - needle.count) {
            let substr = String(Array(haystack)[i..<(i+needle.count)])
            if substr == needle {
                return i
            }
        }
        return -1
    }
}



/***
 214. Shortest Palindrome
 Hard

 Given a string s, you are allowed to convert it to a palindrome by adding characters in front of it. Find and return the shortest palindrome you can find by performing this transformation.
 
 Example 1:
 
 Input: "aacecaaa"
 Output: "aaacecaaa"
 Example 2:
 
 Input: "abcd"
 Output: "dcbabcd"
 ***/


class Solution214x1 {
    func shortestPalindrome(_ s: String) -> String {
        let characters = Array(s)
        var end = s.count
        while true {
            var j = 0
            var i = end-1
            while i >= 0 {
                if characters[i] == characters[j] {
                    j += 1
                }
                i -= 1
            }
            if j == end {
                break
            }
            end = j
        }
        return (s.suffix(s.count-end).reversed() + s)
    }
}


class Solution214x2 {
    func shortestPalindrome(_ s: String) -> String {
        let sArray = Array(s)
        var j = 0
        for i in (0..<s.count).reversed() {
            if sArray[i] == sArray[j] {
                j += 1
            }
        }
        if j == s.count { return s }
        let suffix = String(s[s.index(s.startIndex, offsetBy: j)...])
        let prefix = suffix.reversed()
        let mid = shortestPalindrome(String(s[s.index(s.startIndex, offsetBy:0)..<s.index(s.startIndex, offsetBy:j)]))
        
        return prefix + mid + suffix
    }
}


class Solution214x3 {
    func shortestPalindrome(_ s: String) -> String {
        let sArray = Array(s)
        var j = 0
        for i in (0..<sArray.count).reversed() {
            if sArray[i] == sArray[j] {
                j += 1
            }
        }
        if j == sArray.count { return s }
        let suffix = String(sArray[j...])
        let prefix = suffix.reversed()
        let mid = shortestPalindrome(String(sArray[0..<j]))
        return prefix + mid + suffix
    }
}


class Solution214x4 {
    func shortestPalindrome(_ s: String) -> String {
        let characters = Array(s)
        var end = s.count
        while true {
            var j = 0
            var i = end-1
            while i >= 0 {
                if characters[i] == characters[j] {
                    j += 1
                }
                i -= 1
            }
            if j == end {
                break
            }
            end = j
        }
        let prefix = String(s.suffix(s.count-end).reversed())
        return (prefix + s)
    }
}

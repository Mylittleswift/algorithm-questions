/***
 14. Longest Common Prefix
 Easy

 Write a function to find the longest common prefix string amongst an array of strings.
 
 If there is no common prefix, return an empty string "".
 
 Example 1:
 
 Input: ["flower","flow","flight"]
 Output: "fl"
 Example 2:
 
 Input: ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
 Note:
 
 All given inputs are in lowercase letters a-z.
 ***/



class Solution14x1 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
        var shortestPrefix = strs.min{ $0.count < $1.count }!
        for s in strs {
            while shortestPrefix.count > 0 , !s.hasPrefix(shortestPrefix) {
                shortestPrefix.removeLast()
            }
        }
        return shortestPrefix
    }
}


class Solution14x2 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var res = ""
        if strs.isEmpty {
            return res
        }
        res = strs[0]
        
        for i in 1..<strs.count {
            var find = Array(strs[i])
            var current = Array(res)
            res = ""
            for i in 0..<find.count {
                if i >= current.count {
                    break
                }
                if current[i] != find[i] {
                    break
                } else {
                    res += String(current[i])
                }
            }
        }
        return res
    }
}


class Solution14x3 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let first = strs.first else { return "" }
        var currentPrefix = ""
        var bestPrefix = ""
        
        for letter in first {
            currentPrefix.append(letter)
            for word in strs {
                if !word.hasPrefix(currentPrefix) {
                    return bestPrefix
                }
            }
            bestPrefix = currentPrefix
        }
        return bestPrefix
    }
}

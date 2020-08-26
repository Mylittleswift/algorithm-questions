/***
 139. Word Break
 Medium

 Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.
 
 Note:
 
 The same word in the dictionary may be reused multiple times in the segmentation.
 You may assume the dictionary does not contain duplicate words.
 Example 1:
 
 Input: s = "leetcode", wordDict = ["leet", "code"]
 Output: true
 Explanation: Return true because "leetcode" can be segmented as "leet code".
 Example 2:
 
 Input: s = "applepenapple", wordDict = ["apple", "pen"]
 Output: true
 Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
 Note that you are allowed to reuse a dictionary word.
 Example 3:
 
 Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
 Output: false
 ***/



class Solution139x1 {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = Array(repeating:false,count:s.count + 1)
        var wordSet = Set(wordDict)
        var maxWordLen = 0
        for word in wordDict {
            maxWordLen = max(maxWordLen,word.count)
        }
        
        dp[0] = true
        var s = Array(s)
        for start in stride(from:0,to:s.count,by:1) {
            if !dp[start] {
                continue
            }
            for end in stride(from:start, to:s.count, by:1) {
                if end - start + 1 > maxWordLen {
                    break
                }
                if dp[start] && wordSet.contains(String(s[start...end])) {
                    dp[end + 1] = true
                }
            }
        }
        return dp[s.count]
    }
}


class Solution139x2 {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let wordSet = Set(wordDict)
        var dp = Array(repeating: false, count: s.count + 1), maxLength = 0
        dp[0] = true
        for word in wordSet {
            maxLength = max(maxLength, word.count)
        }
        for i in 1...s.count {
            for j in 0..<i {
                if i - j <= maxLength && dp[j] && wordSet.contains(String(s.prefix(i).suffix(i - j))) {
                    dp[i] = true
                    break
                }
            }
        }
        return dp.last!
    }
}


class Solution139x3 {
    var memo: [String: Bool] = [:]
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        // print("This is s: \(s) and dict : \(wordDict)")
        if memo[s] != nil && memo[s] == false {
            return false
        }
        if s.isEmpty {
            return true
        }
        for word in wordDict {
            var newS = s
            if newS.hasPrefix(word) {
                let range = 0...word.count
                let replace = ""
                newS = String(newS.dropFirst(word.count))
                // print("new2 : \(newS)")
                if wordBreak(newS, wordDict) {
                    memo[s] = true
                    return true
                }
            }
        }
        memo[s] = false
        return false
    }
}


class Solution139x4 {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var hash = [String:Bool]()
        var mem = [Int:Bool]()
        for word in wordDict {
            hash[word] = true
        }
        let chars = Array(s).map { String($0) }
        return helper(chars,0,"",hash,&mem)
    }
    func helper(_ chars: [String], _ index: Int, _ curString:String, _ hash:[String:Bool],  _ mem: inout [Int:Bool] ) -> Bool {
        if index == chars.count { return curString == "" }
        if curString == "" {
            if mem[index] == true { return false }
            else { mem[index] = true }
        }
        let newStr = curString + chars[index]
        if hash[newStr] == true {
            return helper(chars,index+1,"",hash,&mem) || helper(chars,index+1,newStr,hash,&mem)
        } else {
            return helper(chars,index+1,newStr,hash,&mem)
        }
    }
}

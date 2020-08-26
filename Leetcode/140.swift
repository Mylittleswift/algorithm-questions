/***
 140. Word Break II
 Hard

 Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, add spaces in s to construct a sentence where each word is a valid dictionary word. Return all such possible sentences.
 
 Note:
 
 The same word in the dictionary may be reused multiple times in the segmentation.
 You may assume the dictionary does not contain duplicate words.
 Example 1:
 
 Input:
 s = "catsanddog"
 wordDict = ["cat", "cats", "and", "sand", "dog"]
 Output:
 [
 "cats and dog",
 "cat sand dog"
 ]
 Example 2:
 
 Input:
 s = "pineapplepenapple"
 wordDict = ["apple", "pen", "applepen", "pine", "pineapple"]
 Output:
 [
 "pine apple pen apple",
 "pineapple pen apple",
 "pine applepen apple"
 ]
 Explanation: Note that you are allowed to reuse a dictionary word.
 Example 3:
 
 Input:
 s = "catsandog"
 wordDict = ["cats", "dog", "sand", "and", "cat"]
 Output:
 []
 ***/




class Solution140x1 {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        
        var map = [String: [String]]()
        var wordDict = wordDict
        return helper(s, &wordDict, &map)
    }
    func helper(_ s: String, _ wordDict: inout [String], _ map: inout [String: [String]]) -> [String] {
        if s.count == 0 { return [""] }
        if let value = map[s] {
            return value
        }
        var res = [String]()
        for word in wordDict {
            if !s.hasPrefix(word) { continue }
            let subs = helper(s.substring(from: word.endIndex), &wordDict, &map)
            for sub in subs {
                if sub.isEmpty {
                    res.append(word)
                }
                else {
                    res.append(word + " " + sub)
                }
            }
        }
        map[s] = res
        return res
    }
}


class Solution140x2 {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        var computedSentences = [String: [String]]()
        return sentences(s, wordDict, &computedSentences)
    }
    
    func sentences(_ s: String, _ wordDict: [String], _ computedSentences: inout [String: [String]]) -> [String] {
        
        if let precomputed = computedSentences[s] {
            return precomputed
        }
        
        if s.isEmpty {
            return [""]
        }
        
        var results = [String]()
        for word in wordDict where s.starts(with: word) {
            let subSentences = sentences(String(s.dropFirst(word.count)), wordDict, &computedSentences)
            for subSentence in subSentences {
                if subSentence.isEmpty {
                    results.append(word)
                } else {
                    results.append("\(word) \(subSentence)")
                }
            }
        }
        
        computedSentences[s] = results
        return results
    }
}



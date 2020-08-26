/***
 30. Substring with Concatenation of All Words
 Hard

 You are given a string, s, and a list of words, words, that are all of the same length. Find all starting indices of substring(s) in s that is a concatenation of each word in words exactly once and without any intervening characters.
 
 
 
 Example 1:
 
 Input:
 s = "barfoothefoobarman",
 words = ["foo","bar"]
 Output: [0,9]
 Explanation: Substrings starting at index 0 and 9 are "barfoo" and "foobar" respectively.
 The output order does not matter, returning [9,0] is fine too.
 Example 2:
 
 Input:
 s = "wordgoodgoodgoodbestword",
 words = ["word","good","best","word"]
 Output: []
 ***/


class Solution30x1 {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        guard !words.isEmpty else {
            return []
        }
        guard !s.isEmpty else {
            return words.contains("") ? [0] : []
        }
        
        let string = Array(s)
        let wordLength = words[0].count
        let totalWordLength = words.count * wordLength
        
        guard totalWordLength <= string.count else {
            return []
        }
        
        let originalWordToCount = words.reduce(into: [:], { $0[$1, default:0] += 1 })
        
        var startingIndices: [Int] = []
        
        for i in 0..<wordLength {
            
            var startIndex = i
            var wordToCount = originalWordToCount
            
            for j in stride(from: i, to: string.count-wordLength+1, by: wordLength) {
                
                let word = String(string[j..<(j+wordLength)])
                
                if originalWordToCount[word] != nil {
                    
                    while wordToCount[word] == nil {
                        let startWord = String(string[startIndex..<(startIndex+wordLength)])
                        wordToCount[startWord, default: 0] += 1
                        startIndex += wordLength
                    }
                    
                    if let currentCount = wordToCount[word] {
                        if currentCount == 1 {
                            wordToCount[word] = nil
                        } else {
                            wordToCount[word] = currentCount - 1
                        }
                    }
                    
                    if wordToCount.isEmpty {
                        startingIndices.append(startIndex)
                        
                        let startWord = String(string[startIndex..<(startIndex+wordLength)])
                        wordToCount[startWord, default: 0] += 1
                        startIndex += wordLength
                    }
                    
                } else {
                    // reset
                    startIndex = j+wordLength
                    wordToCount = originalWordToCount
                }
            }
        }
        
        return startingIndices
    }
}



class Solution30x4 {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        if words.isEmpty {
            return []
        }
        let wordLen = words[0].count
        let substrLen = words.count * wordLen
        
        if s.count <  substrLen {
            return []
        }
        
        var answer = [Int]()
        answer.reserveCapacity(s.count)
        
        var dict = [String:Int]()
        for w in words {
            var count = 1
            if let v = dict[w] {
                count = count + v
            }
            dict[w] = count
        }
        
        var i = s.startIndex
        let end = s.index(s.endIndex, offsetBy: -substrLen)
        while i <= end {
            if isSubstring(s[i..<s.index(i, offsetBy:substrLen)], dict, wordLen) {
                answer.append(s.distance(from: s.startIndex, to: i))
            }
            i = s.index(after: i)
        }
        return answer
    }
    
    func isSubstring(_ s: Substring, _ words: [String:Int], _ wordLen: Int) -> Bool {
        var d = words
        var substr = s
        while !substr.isEmpty {
            let w = String(substr[substr.startIndex..<substr.index(substr.startIndex, offsetBy: wordLen)])
            if let c = d[w], c > 0 {
                d[w] = c - 1
            } else {
                return false
            }
            substr = substr[substr.index(substr.startIndex, offsetBy: wordLen)...]
        }
        return true
    }
}

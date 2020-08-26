/***
 127. Word Ladder
 Medium

 Given two words (beginWord and endWord), and a dictionary's word list, find the length of shortest transformation sequence from beginWord to endWord, such that:
 
 Only one letter can be changed at a time.
 Each transformed word must exist in the word list.
 Note:
 
 Return 0 if there is no such transformation sequence.
 All words have the same length.
 All words contain only lowercase alphabetic characters.
 You may assume no duplicates in the word list.
 You may assume beginWord and endWord are non-empty and are not the same.
 Example 1:
 
 Input:
 beginWord = "hit",
 endWord = "cog",
 wordList = ["hot","dot","dog","lot","log","cog"]
 
 Output: 5
 
 Explanation: As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
 return its length 5.
 Example 2:
 
 Input:
 beginWord = "hit"
 endWord = "cog"
 wordList = ["hot","dot","dog","lot","log"]
 
 Output: 0
 
 Explanation: The endWord "cog" is not in wordList, therefore no possible transformation.
 ***/


class Solution127x1 {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        if !wordList.contains(endWord)
        {
            return 0
        }
        
        let dict = Set(wordList)
        var beginSet = Set<String>()
        var endSet = Set<String>()
        var visitedSet = Set<String>()
        var length = 1
        var found = false
        
        beginSet.insert(beginWord)
        endSet.insert(endWord)
        
        while !found && !beginSet.isEmpty && !endSet.isEmpty {
            var nextSet = Set<String>()
            //accelerating search speed by swap begin and end
            if beginSet.count > endSet.count {
                swap(&beginSet, &endSet)
            }
            found = helper(beginSet, endSet, dict, &visitedSet, &nextSet)
            beginSet = nextSet
            length += 1
        }
        return found ? length : 0
    }
    
    private func helper(_ beginSet: Set<String>, _ endSet: Set<String>, _ dict: Set<String>,
                        _ visitedSet: inout Set<String>, _ resSet: inout Set<String>) -> Bool {
        
        let alphaArray = Array("abcdefghijklmnopqrstuvwxyz")
        
        for word in beginSet {
            for i in 0 ..< word.count {
                var chars = Array(word)
                for j in 0 ..< alphaArray.count{
                    chars[i] = alphaArray[j]
                    let str = String(chars)
                    if dict.contains(str) {
                        if endSet.contains(str)
                        {
                            return true
                        }
                        if !visitedSet.contains(str)
                        {
                            resSet.insert(str)
                            visitedSet.insert(str)
                        }
                    }
                }
            }
        }
        return false
    }
}


class Solution127x2 {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        // ensure the endWord is in the wordList
        if !wordList.contains(endWord) {
            return 0
        }
        
        // build a word map with char array representations
        // this saves an enormous amount of time
        var wordMap: [String: [Character]] = [:]
        for i in 0..<wordList.count {
            // beginWord should never be in the list
            if wordList[i] == beginWord {
                continue
            }
            wordMap[wordList[i]] = [Character](wordList[i])
        }
        
        // we work the problem from the begining forward and end backwards
        // this allows us to deal with the smallest set of possibilities in
        // both "directions"
        var beginMap:[String: [Character]] = [beginWord: [Character](beginWord)]
        var endMap:[String: [Character]] = [endWord: [Character](endWord)]
        
        // burnedMap bridges what has been used in both beginMap or endMap
        var burnedMap:[String: [Character]] = [:]
        
        // word len is stable throughout the iterations, pay for it only once
        let wordLen = beginWord.count
        
        // mutations tracts how many time mutated on the road from beginWord to endWord
        var mutations = 1
        
        // we continue while beginMap and endMap are non-empty
        // if one empties, there is no path from beginWord to endWord
        while !beginMap.isEmpty && !endMap.isEmpty {
            // minimize the working set by swapping in the smaller
            // set, we only care about the mutation count
            if beginMap.count > endMap.count {
                let tempMap = beginMap
                beginMap = endMap
                endMap = tempMap
            }
            
            // track the upcoming set of mutation candidates we're about to create
            var newMap: [String: [Character]] = [:]
            
            // iterate throught he last set of mutation candidates
            for candidateKV in beginMap {
                let candidateChars = candidateKV.value
                
                // walk through all the remaining (un-burned) valid words
                for wordKV in wordMap {
                    let word = wordKV.key
                    let wordChars = wordKV.value
                    
                    // diff the candidate and valid words looking
                    // fir diffs of 1 character
                    var diffs = 0
                    
                    for i in 0..<wordLen {
                        if candidateChars[i] != wordChars[i] {
                            diffs += 1
                            if diffs > 1 {
                                break
                            }
                        }
                    }
                    
                    // anything other than a diff of 1 is not applicable
                    // in this loop, we can only consider "word" if the
                    // diff is exactly 1
                    if diffs == 1 {
                        // we have a valid 1 character diff, use it
                        
                        if endMap[word] != nil {
                            // base case reached
                            return mutations + 1
                        }
                        
                        if burnedMap[word] == nil {
                            newMap[word] = wordChars
                            burnedMap[word] = wordChars
                        }
                    }
                }
            }
            
            // we already evaluated what was in beginMap, we can
            // lose those and use the newMap evaluation set
            beginMap = newMap
            
            // we have completed an additional mutation step
            mutations += 1
        }
        
        return 0
    }
}


class Solution127x3 {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var queue = [beginWord]
        var wordList = Set(wordList)
        var length = 1
        
        while !queue.isEmpty && !wordList.isEmpty {
            let count = queue.count
            for _ in 0..<count {
                let word = queue.removeFirst()
                
                let validTransforms = validTransformations(word, wordList)
                for nextWord in validTransforms {
                    if nextWord == endWord {
                        return length + 1
                    }
                    wordList.remove(nextWord)
                    queue.append(nextWord)
                }
            }
            
            length += 1
        }
        
        return 0
    }
    
    func validTransformations(_ word: String, _ wordList: Set<String>) -> [String] {
        var result = [String]()
        let alpahabetArray = Array("abcdefghijklmnopqrstuvwxyz")
        for i in 0 ..< word.count {
            var chars = Array(word)
            for j in 0 ..< alpahabetArray.count {
                chars[i] = alpahabetArray[j]
                let newWord = String(chars)
                if wordList.contains(newWord) {
                    result.append(newWord)
                }
            }
        }
        
        return result
    }
}


class Solution127x4 {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        guard wordList.contains(endWord) else {
            return 0
        }
        
        var wordMap: [String: Int] = [:]
        for word in wordList {
            wordMap[word] = 1
        }
        
        var sequence: [String] = [beginWord]
        var map: [String: Int] = [beginWord : 1]
        let letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                       "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        
        while sequence.count > 0 {
            
            let bw = sequence.removeFirst()
            
            let level = map[bw]!
            
            let bws: [Character] = [Character](bw)
            for i in 0..<bws.count {
                var chas = bws
                for c in letters {
                    if bws[i] != Character(c) {
                        chas[i] = Character(c)
                        let word = String(chas)
                        
                        if word == endWord {
                            return level + 1
                        }
                        
                        if wordMap[word] != nil && map[word] == nil {
                            map[word] = level+1
                            sequence.append(word)
                        }
                    }
                }
            }
        }
        
        return 0
    }
}

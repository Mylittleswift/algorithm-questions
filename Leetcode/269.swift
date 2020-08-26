/***
 269 Alien Dictionary
 Hard
 
 Problem:
 There is a new alien language which uses the latin alphabet. However, the order among letters are unknown to you. You receive a list of non-empty words from the dictionary, where words are sorted lexicographically by the rules of this new language. Derive the order of letters in this language.
 Example 1: Given the following words in dictionary,
 [
 "wrt",
 "wrf",
 "er",
 "ett",
 "rftt"
 ]
 The correct order is: "wertf".
 Example 2: Given the following words in dictionary,
 [
 "z",
 "x"
 ]
 The correct order is: "zx".
 Example 3: Given the following words in dictionary,
 [
 "z",
 "x",
 "z"
 ]
 The order is invalid, so return "".
 Note:
 You may assume all letters are in lowercase.
 You may assume that if a is a prefix of b, then a must appear before b in the given dictionary.
 If the order is invalid, return an empty string.
 There may be multiple valid order of letters, return any one of them is fine.
 ***/



class Solution269 {
    func alienOrder(_ words: [String]) -> String {
        var st:Set<[Character]> = Set<[Character]>()
        var ch:Set<Character> = Set<Character>()
        var ins:[Int] = [Int](repeating:0,count:256)
        var q:[Character] = [Character]()
        var res:String = String()
        for a in words
        {
            for c in a
            {
                ch.insert(c)
            }
        }
        for i in 0..<words.count - 1
        {
            let mn:Int = min(words[i].count, words[i + 1].count)
            var j:Int = 0
            while(j < min(words[i].count, words[i + 1].count))
            {
                if words[i][j] != words[i + 1][j]
                {
                    st.insert([words[i][j], words[i + 1][j]])
                    break
                }
                j += 1
            }
            if j == mn && words[i].count > words[i + 1].count
            {
                return String()
            }
        }
        for a in st
        {
            ins[a[1].ascii] += 1
        }
        for a in ch
        {
            if ins[a.ascii] == 0
            {
                q.append(a)
                res.append(a)
            }
        }
        while(!q.isEmpty)
        {
            let c:Character = q.removeFirst()
            for a in st
            {
                if a[0] == c
                {
                    ins[a[1].ascii] -= 1
                    if ins[a[1].ascii] == 0
                    {
                        q.append(a[1])
                        res.append(a[1])
                    }
                }
            }
        }
        return res.count == ch.count ? res : String()
    }
}


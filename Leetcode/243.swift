/***
 243 LeetCode Java: Shortest Word Distance
 Easy

 Problem:
 Given a list of words and two words word1 and word2, return the shortest distance between these two words in the list.
 
 For example,
 Assume that words = [“practice”, “makes”, “perfect”, “coding”, “makes”].
 
 Given word1 = “coding”, word2 = “practice”, return 3.
 Given word1 = “makes”, word2 = “coding”, return 1.
 
 Note:
 You may assume that word1 does not equal to word2, and word1 and word2 are both in the list.
 ***/



class Solution243x1 {
    func shortestDistance(_ words: [String],_ word1:String,_ word2:String) -> Int {
        var idx:Int = -1
        var res:Int = Int.max
        for i in 0..<words.count
        {
            if words[i] == word1 || words[i] == word2
            {
                if idx != -1 && words[idx] != words[i]
                {
                    res = min(res, i - idx)
                }
                idx = i
            }
        }
        return res
    }
}


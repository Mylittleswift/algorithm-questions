/***
 245 LeetCode Java: Shortest Word Distance III – Medium

 Problem:
 This is a follow up of Shortest Word Distance. The only difference is now word1 could be the same as word2.
 
 Given a list of words and two words word1 and word2, return the shortest distance between these two words in the list.
 
 word1 and word2 may be the same and they represent two individual words in the list.
 
 For example,
 Assume that words = [“practice”, “makes”, “perfect”, “coding”, “makes”].
 
 Given word1 = “makes”, word2 = “coding”, return 1.
 Given word1 = “makes”, word2 = “makes”, return 3.
 
 Note:
 You may assume word1 and word2 are both in the list.
 ***/



class Solution245x1 {
    func shortestWordDistance(_ words: [String],_ word1:String,_ word2:String) -> Int {
        var idx:Int = -1
        var res:Int = Int.max
        for i in 0..<words.count
        {
            if words[i] == word1 || words[i] == word2
            {
                if idx != -1 && (word1 == word2 || words[i] != words[idx])
                {
                    res = min(res, i - idx)
                }
                idx = i
            }
        }
        return res
    }
}

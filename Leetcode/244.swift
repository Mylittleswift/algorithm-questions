/***
 244 LeetCode Java: Shortest Word Distance II – Medium

 Problem:
 This is a follow up of Shortest Word Distance. The only difference is now you are given the list of words and your method will be called repeatedly many times with different parameters. How would you optimize it?
 
 Design a class which receives a list of words in the constructor, and implements a method that takes two words word1 and word2 and return the shortest distance between these two words in the list.
 
 For example,
 Assume that words = [“practice”, “makes”, “perfect”, “coding”, “makes”].
 
 Given word1 = “coding”, word2 = “practice”, return 3.
 Given word1 = “makes”, word2 = “coding”, return 1.
 
 Note:
 You may assume that word1 does not equal to word2, and word1 and word2 are both in the list.
 ***/



class WordDistance244x1 {
    var m:[String:[Int]] = [String:[Int]]()
    init(_ words: [String]) {
        // perform some initialization here
        for i in 0..<words.count
        {
            //判断是否为空
            if m[words[i]] == nil
            {
                m[words[i]] = [Int]()
            }
            m[words[i]]!.append(i)
        }
    }
    
    func shortest(_ word1:String,_ word2:String) -> Int {
        var i:Int = 0
        var j:Int = 0
        var res:Int = Int.max
        while(i < m[word1]!.count && j < m[word2]!.count)
        {
            res = min(res, abs(m[word1]![i] - m[word2]![j]))
            if m[word1]![i] < m[word2]![j]
            {
                i += 1
            }
            else
            {
                j += 1
            }
        }
        return res
    }
}

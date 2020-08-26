/***
 72. Edit Distance
 Hard

 Given two words word1 and word2, find the minimum number of operations required to convert word1 to word2.
 
 You have the following 3 operations permitted on a word:
 
 Insert a character
 Delete a character
 Replace a character
 Example 1:
 
 Input: word1 = "horse", word2 = "ros"
 Output: 3
 Explanation:
 horse -> rorse (replace 'h' with 'r')
 rorse -> rose (remove 'r')
 rose -> ros (remove 'e')
 Example 2:
 
 Input: word1 = "intention", word2 = "execution"
 Output: 5
 Explanation:
 intention -> inention (remove 't')
 inention -> enention (replace 'i' with 'e')
 enention -> exention (replace 'n' with 'x')
 exention -> exection (replace 'n' with 'c')
 exection -> execution (insert 'u')
 ***/



class Solution72x1 {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1.count == 0 {
            return word2.count
        }
        if word2.count == 0 {
            return word1.count
        }
        
        let c1 = Array(word1)
        let c2 = Array(word2)
        var cache = [[Int]](repeating: [Int](repeating: -1, count: c2.count), count: c1.count)
        
        return match(c1, c2, 0, 0, &cache)
    }
    
    fileprivate func match(_ c1: [Character], _ c2: [Character], _ i: Int, _ j: Int, _ cache: inout [[Int]]) -> Int {
        if c1.count == i {
            return c2.count - j
        }
        if c2.count == j {
            return c1.count - i
        }
        
        if cache[i][j] != -1 {
            return cache[i][j]
        }
        
        if c1[i] == c2[j] {
            cache[i][j] = match(c1, c2, i + 1, j + 1, &cache)
        } else {
            let insert = match(c1, c2, i, j + 1, &cache)
            let delete = match(c1, c2, i + 1, j, &cache)
            let replace = match(c1, c2, i + 1, j + 1, &cache)
            
            cache[i][j] = min(min(insert, delete), replace) + 1
        }
        
        return cache[i][j]
    }
}


class Solution72x2 {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        var w1arr = Array(word1)
        var w2arr = Array(word2)
        let w1len  = w1arr.count
        let w2len = w2arr.count
        
        if(word1.isEmpty && word2.isEmpty) {
            return 0
        }
        if(word1.isEmpty) {
            return word2.count
        }
        else if(word2.isEmpty) {
            return word1.count
        }
        
        var dp = Array(repeating:Array(repeating:0,count:w2len+1),count:w1len+1)
        
        for i in 0...w2len {
            dp[0][i] = i
        }
        for i in 0...w1len {
            dp[i][0] = i
        }
        
        for idx1 in 1...w1len {
            for idx2 in 1...w2len {
                let minChange = min(min(dp[idx1-1][idx2],dp[idx1-1][idx2-1]),dp[idx1][idx2-1])
                dp[idx1][idx2] = w1arr[idx1-1] == w2arr[idx2-1] ?  dp[idx1-1][idx2-1] : minChange + 1
            }
        }
        
        return dp[w1len][w2len]
        
    }
}



class Solution72x3 {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        var res = Array(repeating: Array(repeating: 0, count: word2.count + 1), count: word1.count + 1)
        let word1Array = Array(word1)
        let word2Array = Array(word2)
        for i in 0...word1.count {
            for j in 0...word2.count {
                if i == 0 {
                    res[i][j] = j
                }else if j == 0 {
                    res[i][j] = i
                }else if word1Array[i - 1] == word2Array[j - 1] {
                    res[i][j] = res[i - 1][j - 1]
                }else {
                    res[i][j] = min(res[i - 1][j - 1], min(res[i - 1][j], res[i][j - 1])) + 1
                }
            }
        }
        return res[word1.count][word2.count]
    }
}

/***
 97. Interleaving String
 Hard

 Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2.
 
 Example 1:
 
 Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
 Output: true
 Example 2:
 
 Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
 Output: false
 ***/



class Solution97x1 {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        var cache = [[Int]](repeating: [Int](repeating: -1, count: s2.count), count: s1.count)
        return is_Interleave(s1, 0, s2, 0, s3, 0, &cache)
    }
    
    fileprivate func is_Interleave(_ s1: String, _ i: Int, _ s2: String, _ j: Int, _ s3: String, _ k: Int, _ cache: inout [[Int]]) -> Bool {
        if i == s1.count {
            return s2[j..<s2.count] == s3[k..<s3.count]
        }
        if j == s2.count {
            return s1[i..<s1.count] == s3[k..<s3.count]
        }
        if cache[i][j] >= 0 {
            return cache[i][j] == 1 ? true : false
        }
        
        var ans = false
        
        if (s3[k] == s1[i] && is_Interleave(s1, i + 1, s2, j, s3, k + 1, &cache)) ||
            (s3[k] == s2[j] && is_Interleave(s1, i, s2, j + 1, s3, k + 1, &cache)) {
            ans = true
        }
        cache[i][j] = ans ? 1 : 0
        
        return ans
    }
}

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript(_ range: CountableRange<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: max(0, range.lowerBound))
        let idx2 = index(startIndex, offsetBy: min(self.count, range.upperBound))
        return String(self[idx1..<idx2])
    }
}

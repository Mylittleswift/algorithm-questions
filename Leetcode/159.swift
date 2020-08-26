/***
 159. Longest Substring with At Most Two Distinct Characters
 Hard
 
 https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/
 Given a string, find the length of the longest substring T that contains at most 2 distinct characters.
 For example, Given s = “eceba”,
 T is "ece" which its length is 3.
 ***/



class Solution159 {
    func lengthOfLongestSubstringTwoDistinct(_ s:String) -> Int {
        var left:Int = 0
        var right:Int = -1
        var res:Int = 0
        for i in 1..<s.count
        {
            if s[i] == s[i - 1] {continue}
            if right >= 0 && s[right] != s[i]
            {
                res = max(res, i - left)
                left = right + 1
            }
            right = i - 1
        }
        return max(s.count - left, res)
    }
}

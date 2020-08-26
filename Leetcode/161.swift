/***
 161 One Edit Distance
 Medium
 
 Given two strings s and t, determine if they are both one edit distance apart.
 
 Note:
 
 There are 3 possiblities to satisify one edit distance apart:
 
 Insert a character into s to get t
 Delete a character from s to get t
 Replace a character of s to get t
 Example 1:
 
 Input: s = "ab", t = "acb"
 Output: true
 Explanation: We can insert 'c' into s to get t.
 Example 2:
 
 Input: s = "cab", t = "ad"
 Output: false
 Explanation: We cannot get t from s by only one step.
 Example 3:
 
 Input: s = "1203", t = "1213"
 Output: true
 Explanation: We can replace '0' with '1' to get t.
 ***/


class Solution161 {
    func isOneEditDistance(_ s:String, _ t:String) -> Bool{
        var num:Int = min(s.count, t.count)
        for i in 0..<num
        {
            if s.count == t.count
            {
                return s.substring(i + 1) == t.substring(i + 1)
            }
            else if s.count < t.count
            {
                return s.substring(i) == t.substring(i + 1)
            }
            else
            {
                return s.substring(i + 1) == t.substring(i)
            }
        }
        return abs(s.count - t.count) == 1
    }
}


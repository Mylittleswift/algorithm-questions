/***
 291 Word Pattern II
 Hard
 
 Problem
 Given a pattern and a string str, find if str follows the same pattern.
 Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty substring in str.
 Examples: pattern = "abab", str = "redblueredblue" should return true. pattern = "aaaa", str = "asdasdasdasd" should return true. pattern = "aabb", str = "xyzabcxzyabc" should return false. Notes: You may assume both pattern and str contains only lowercase letters.
 ***/


class Solution291 {
    var m:[Character:String] = [Character:String]()
    var s:Set<String> = Set<String>()
    func wordPatternMatch(_ pattern:String,_ str:String) -> Bool {
        if pattern.isEmpty {return str.isEmpty}
        var arrChar:[Character] = Array( pattern)
        if m[arrChar[0]] != nil
        {
            var t:String = m[arrChar[0]]!
            if t.count > str.count || str.subString(0, t.count) != t
            {
                return false
            }
            if wordPatternMatch(pattern.subString(1), str.subString(t.count))
            {
                return true
            }
        }
        else
        {
            for i in 1...str.count
            {
                if s.contains(str.subString(0, i)) {continue}
                m[arrChar[0]] = str.subString(0, i)
                s.insert(str.subString(0, i))
                if wordPatternMatch(pattern.subString(1), str.subString(i))
                {
                    return true
                }
                m[arrChar[0]] = nil
                s.remove(str.subString(0, i))
            }
        }
        return false
    }
}

extension String {
    // 截取字符串：从index到结束处
    // - Parameter index: 开始索引
    // - Returns: 子字符串
    func subString(_ index: Int) -> String {
        let theIndex = self.index(self.endIndex, offsetBy: index - self.count)
        return String(self[theIndex..<endIndex])
    }
    
    // 截取字符串：指定索引和字符数
    // - begin: 开始截取处索引
    // - count: 截取的字符数量
    func subString(_ begin:Int,_ count:Int) -> String {
        let start = self.index(self.startIndex, offsetBy: max(0, begin))
        let end = self.index(self.startIndex, offsetBy:  min(self.count, begin + count))
        return String(self[start..<end])
    }
}

/***
 49. Group Shifted Strings
 Medium
 
 Given a string, we can "shift" each of its letter to its successive letter, for example: "abc" -> "bcd". We can keep "shifting" which forms the sequence:
 "abc" -> "bcd" -> ... -> "xyz"
 
 Given a list of strings which contains only lowercase alphabets, group all strings that belong to the same shifting sequence.
 
 For example, given: ["abc", "bcd", "acef", "xyz", "az", "ba", "a", "z"],
 A solution is:
 [
 ["abc","bcd","xyz"],
 ["az","ba"],
 ["acef"],
 ["a","z"]
 ]
 ***/


class Solution249 {
    func groupStrings(_ strings:[String]) -> [[String]] {
        var res:[[String]] = [[String]]()
        var m:[String:Set<String>] = [String:Set<String>]()
        for a in strings
        {
            var t:String = ""
            for c in a.characters
            {
                t += String((c.ascii + 26 - a[0].ascii) % 26) + ","
            }
            if m[t] == nil
            {
                m[t] = Set<String>()
            }
            m[t]!.insert(a)
        }
        for it in m.values
        {
            res.append(Array(it))
        }
        return res
    }
}

extension Character
{
    //属性：ASCII整数值(定义小写为整数值)
    var ascii: Int {
        get {
            let s = String(self).unicodeScalars
            return Int(s[s.startIndex].value)
        }
    }
}

extension String {
    //subscript函数可以检索数组中的值
    //直接按照索引方式截取指定索引的字符
    subscript (_ i: Int) -> Character {
        //读取字符
        get {return self[index(startIndex, offsetBy: i)]}
    }
}

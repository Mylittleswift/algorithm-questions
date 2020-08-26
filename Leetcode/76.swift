/***
 76. Minimum Window Substring
 Hard

 Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).
 
 Example:
 
 Input: S = "ADOBECODEBANC", T = "ABC"
 Output: "BANC"
 Note:
 
 If there is no such window in S that covers all characters in T, return the empty string "".
 If there is such window, you are guaranteed that there will always be only one unique minimum window in S.
 ***/



class Solution76x1 {
    //initialize two pointers- left and right and initialize both to the first element of string s.
    //In any sliding window problem, we have two pointers. One right pointer whose job is to expand the current
    //window and the left pointer whose hob is to contract the given window. At any point, only one of those pointers
    //move and the other stay fixed.
    
    func minWindow(_ s: String, _ t: String) -> String {
        //convert the strings to character array
        //the map is necessary to convert uint8 to Int
        let schars = Array(s.utf8).map {Int($0)}
        let tchars = Array(t.utf8).map {Int($0)}
        
        
        //create hashmap
        var hash = Array(repeating: 0, count: 128)
        
        for tchar in tchars {
            hash[tchar] += 1
        }
        
        var count = tchars.count
        var start = 0
        var left = 0
        var right = 0
        var length = Int.max
        
        //We use the right pointer to expand the window until we get a desirable window i.e. a window that contains all of the characters of
        // t
        while right < schars.count {
            //if this character from schars is present in hash (i.e. in tchars), decrement count and also the count for that char in the hash by 1.
            if hash[schars[right]] > 0 {
                count -= 1
            }
            hash[schars[right]] -= 1
            right += 1
            
            while count == 0 {
                if right - left < length {
                    //keep updating the length value
                    length = right - left
                    start = left
                }
                //Once we have a window with all the characters, we can move the left pointer ahead one by one. If the window is still a desirable one we keep //updating the minimum window size.
                if hash[schars[left]] == 0 {
                    count += 1
                }
                hash[schars[left]] += 1
                left += 1
            }
        }
        
        //not present
        if length > schars.count {
            return ""
        }
        
        let index1 = s.index(s.startIndex, offsetBy: start)
        let index2 = s.index(s.startIndex, offsetBy: start + length)
        
        return String(s[index1..<index2])
    }
}


class Solution76x2 {
    func minWindow(_ s: String, _ t: String) -> String {
        
        let tt = Array(t.utf16).map { Int($0) }
        let ss = Array(s.utf16).map { Int($0) }
        // create hashmap
        var hash = [Int](repeating: 0, count: 128)
        for n in tt {
            hash[n] += 1
        }
        
        var count = tt.count, start = 0, l = 0, r = 0, length = Int.max
        
        while r < ss.count {
            if hash[ss[r]] > 0 {
                count -= 1
            }
            hash[ss[r]] -= 1
            r += 1
            while count == 0 {
                if r - l < length {
                    length = r - l
                    start = l
                }
                if hash[ss[l]] == 0 {
                    count += 1
                }
                hash[ss[l]] += 1
                l += 1
            }
        }
        
        if length > ss.count {
            return ""
        }
        
        let index1 = s.index(s.startIndex, offsetBy: start)
        let index2 = s.index(s.startIndex, offsetBy: start + length)
        return s.substring(with: index1..<index2)
    }
}


class Solution76x3 {
    func minWindow(_ s: String, _ t: String) -> String {
        let ss = Array(s.utf8).map(Int.init)
        let tt = Array(t.utf8).map(Int.init)
        var counts = [Int](repeating: 0, count: 256)
        for char in tt {
            counts[char] += 1
        }
        var left = 0
        var size = t.count
        var res = (-1, -1)
        var minL = Int.max
        for right in 0..<s.count {
            counts[ss[right]] -= 1
            if counts[ss[right]] >= 0 {
                size -= 1
            }
            
            if size == 0 {
                inner: while left < right {
                    counts[ss[left]] += 1
                    if counts[ss[left]] > 0 {
                        size += 1
                        break inner
                    }
                    left += 1
                }
                if right - left + 1 < minL {
                    minL = right - left + 1
                    res = (left, right)
                }
                left += 1
            }
        }
        if res == (-1, -1) { return "" }
        let arr = ss[res.0...res.1]
        return String(arr.map { Character(UnicodeScalar($0)!) } )
    }
}


class Solution76x4 {
    func minWindow(_ s: String, _ t: String) -> String {
        var counter:Int = 0
        var minlen:Int = Int.max
        var begin:Int = 0
        var end:Int = 0
        var head:Int = 0
        var m:[Int] = [Int](repeating:0,count:128)
        counter = t.count
        var arrT:[Int] = Array(t).map{$0.ascii}
        for c in arrT
        {
            m[c]++
        }
        var arrS:[Int] = Array(s).map{$0.ascii}
        while(end < arrS.count)
        {
            if m[arrS[end++]]-- > 0
            {
                counter--
            }
            while(counter==0)
            {
                if minlen > end - begin
                {
                    head = begin
                    minlen = end - (head)
                }
                if m[arrS[begin++]]++ == 0
                {
                    counter++
                }
            }
        }
        let str:String = (minlen == Int.max) ? "" :s.subString(head,minlen)
        return str
        
    }
}

/*扩展Int类，实现自增++、自减--运算符*/
extension Int{
    //后缀++:先执行表达式后再自增
    static postfix func ++(num:inout Int) -> Int {
        //输入输出参数num
        let temp = num
        //num加1
        num += 1
        //返回加1前的数值
        return temp
    }
    //后缀--:先执行表达式后再自减
    static postfix func --(num:inout Int) -> Int {
        //输入输出参数num
        let temp = num
        //num减1
        num -= 1
        //返回减1前的数值
        return temp
    }
}


//Character扩展方法
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
    
    // 截取字符串：指定索引和字符数
    // - begin: 开始截取处索引
    // - count: 截取的字符数量
    func subString(_ begin:Int,_ count:Int) -> String {
        let start = self.index(self.startIndex, offsetBy: max(0, begin))
        let end = self.index(self.startIndex, offsetBy:  min(self.count, begin + count))
        return String(self[start..<end])
    }
}

/***
 186 Reverse Words in a String II
 Medium
 
 Given an input string, reverse the string word by word. A word is defined as a sequence of non-space characters.
 
 The input string does not contain leading or trailing spaces and the words are always separated by a single space.
 
 For example,
 Given s = "the sky is blue",
 return "blue is sky the".
 
 Could you do it in-place without allocating extra space?
***/



class Solution186 {
    func reverseWords(_ s: inout String){
        var left:Int = 0
        for i in 0...s.count
        {
            if i == s.count || s[i] == " "
            {
                reverse(&s, left, i - 1)
                left = i + 1
            }
        }
        reverse(&s, 0, s.count - 1)
    }
    
    func reverse(_ s: inout String,_ left:Int,_ right:Int)
    {
        var left = left
        var right = right
        while (left < right)
        {
            var t:Character = s[left]
            s[left] = s[right]
            s[right] = t
            left += 1
            right -= 1
        }
    }
}

extension String {
    //subscript函数可以检索数组中的值
    //直接按照索引方式截取指定索引的字符
    subscript (_ i: Int) -> Character {
        //读取字符
        get {return self[index(startIndex, offsetBy: i)]}
        
        //修改字符
        set
        {
            var str:String = self
            var index = str.index(startIndex, offsetBy: i)
            str.remove(at: index)
            str.insert(newValue, at: index)
            self = str
        }
    }
}

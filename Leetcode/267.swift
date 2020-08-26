/***
267. Palindrome Permutation II
Medium
 
Problem:
Given a string s, return all the palindromic permutations (without duplicates) of it. Return an empty list if no palindromic permutation could be form.
For example:
Given s = "aabb", return ["abba", "baab"].
Given s = "abc", return [].
Hint:
If a palindromic permutation exists, we just need to generate the first half of the string.
 ***/


class Solution267 {
    func generatePalindromes(_ s:String) -> [String]{
        var res:Set<String> = Set<String>()
        var m:[Character:Int] = [Character:Int]()
        var t:String = ""
        var mid:String = ""
        for a in s.characters
        {
            m[a] = 1
        }
        for (key, val) in m
        {
            if val % 2 == 1
            {
                mid.append(key)
            }
            var str:String = String()
            for i in 0..<val/2
            {
                str.append(key)
            }
            t += str
            if mid.count > 1
            {
                return []
            }
        }
        permute(&t, 0, mid,&res);
        return Array(res)
    }
    
    func permute(_ t:inout String,_ start:Int,_ mid:String,_ res:inout Set<String>)
    {
        if start >= t.count
        {
            let str:String = String(t.reversed())
            res.insert(t + mid + str)
        }
        for i in start..<t.count
        {
            if i != start && t[i] == t[start]
            {
                continue
            }
            var temp:Character
            temp = t[start]
            t[start] = t[i]
            t[i] = temp
            
            permute(&t, start + 1, mid, &res)
            
            temp = t[start]
            t[start] = t[i]
            t[i] = temp
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

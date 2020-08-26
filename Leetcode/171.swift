/***
 171. Excel Sheet Column Number
 Easy

 Given a column title as appear in an Excel sheet, return its corresponding column number.
 
 For example:
 
 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 ...
 Example 1:
 
 Input: "A"
 Output: 1
 Example 2:
 
 Input: "AB"
 Output: 28
 Example 3:
 
 Input: "ZY"
 Output: 701
 ***/


class Solution171x1 {
    func titleToNumber(_ s: String) -> Int {
        //26进制转10进制
        var n:Int = s.count
        var res:Int = 0
        var temp:Int = 1
        // A:65 Z:90
        for m in (0..<n).reversed()
        {
            var letter = s[s.index(s.startIndex,offsetBy:m)]
            var num:Int = Int()
            //使用for-in循环遍历转化成String的letter
            for scalar in String(letter).unicodeScalars
            {
                num = Int(scalar.value)
            }
            //num - 65 + 1
            res += (num - 64) * temp
            temp *= 26
        }
        return res
    }
}


class Solution171x2 {
    func titleToNumber(_ s : String) -> Int {
        
        var i  = 0
        var result = 0
        
        for char in s.unicodeScalars{
            result+=(Int(char.value)-64)*self.canWinNim2(n: (s.count-1-i))
            
            i+=1
        }
        return result
    }
    func canWinNim2( n: Int) -> Int{
        var count = n
        var  ret=1
        while count>0 {
            ret =  self.canWinNim1(ret)
            count-=1
        }
        
        return ret
        
    }
    func canWinNim1(_ n: Int) -> Int{
        return n*26
    }
}


class Solution171x3 {
    func titleToNumber(_ s: String) -> Int {
        
        var columnNumber = 0
        let offset = 64
        
        for letter in s.utf8 {
            columnNumber = columnNumber * 26 + Int(letter) - offset
        }
        
        return columnNumber
    }
}



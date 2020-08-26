/***
 168. Excel Sheet Column Title
 Easy

 Given a positive integer, return its corresponding column title as appear in an Excel sheet.
 
 For example:
 
 1 -> A
 2 -> B
 3 -> C
 ...
 26 -> Z
 27 -> AA
 28 -> AB
 ...
 Example 1:
 
 Input: 1
 Output: "A"
 Example 2:
 
 Input: 28
 Output: "AB"
 Example 3:
 
 Input: 701
 Output: "ZY"
 ***/


class Solution168x1 {
    func convertToTitle(_ n: Int) -> String {
        var m:Int = n
        var temp:String = String()
        while(m > 0)
        {
            //A的ASCII为65
            var num:Int = (m - 1) % 26 + 65
            var s:Character = Character(UnicodeScalar(num)!)
            temp = String(s) + temp
            m = (m - 1)/26
        }
        return temp
    }
}


class Solution168x2 {
    func convertToTitle(_ n: Int) -> String {
        
        guard n > 0 else {
            return ""
        }
        var result = [Character]()
        var n = n
        while n > 0 {
            n = n - 1
            let a = n % 26
            result.append(Character(UnicodeScalar(Int(65) + a )!))
            n /= 26
        }
        
        return String(result.reversed())
        
    }
}

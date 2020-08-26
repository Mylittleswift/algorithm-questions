/***
 273. Integer to English Words
 Hard

 Convert a non-negative integer to its english words representation. Given input is guaranteed to be less than 231 - 1.
 
 Example 1:
 
 Input: 123
 Output: "One Hundred Twenty Three"
 Example 2:
 
 Input: 12345
 Output: "Twelve Thousand Three Hundred Forty Five"
 Example 3:
 
 Input: 1234567
 Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
 Example 4:
 
 Input: 1234567891
 Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"
 ***/



class Solution273x1 {
    func numberToWords(_ num: Int) -> String {
        var lessThan20 = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"];
        var tens = ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"];
        var thousands = ["", "Thousand", "Million", "Billion"]
        
        var result = ""
        var i = 0
        var num = num
        
        if num == 0 {
            return "Zero"
        }
        
        func helper(_ num: Int) -> String {
            if num == 0 {
                return ""
            } else if num < 20 {
                return lessThan20[num] + " "
            } else if num < 100 {
                return tens[num / 10] + " " + helper(num % 10)
            } else {
                return lessThan20[num / 100] + " Hundred " + helper(num % 100)
            }
        }
        
        while num > 0 {
            
            if num % 1000 != 0 {
                result = helper(num % 1000) + thousands[i] + " " + result
            }
            num = num / 1000
            
            i += 1
        }
        result = result.trimmingCharacters(in: Character.whitespaces)
        return result
    }
}


class Solution273x2 {
    let zero2TwentyWords = ["Zero","One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Eleven","Twelve","Thirteen","Fourteen","Fifteen","Sixteen","Seventeen","Eighteen","Nineteen","Twenty"]
    
    let  tensWords = ["","Ten","Twenty","Thirty","Forty","Fifty","Sixty","Seventy","Eighty","Ninety","Hundred"]
    let thousandsWords = ["" , "Thousand" , "Million" , "Billion"]
    
    
    
    func numberToWords(_ num: Int) -> String {
        if num == 0 { return "Zero"}
        var temp = num
        var res = ""
        var i = 0
        while temp > 0 {
            if temp % 1000 != 0 {
                res = helper(num: temp % 1000) + thousandsWords[i] + " " + res
            }
            temp = temp / 1000
            i += 1
        }
        return res.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func helper(num:Int) -> String {
        if num == 0 {
            return ""
        } else if num < 20 {
            return zero2TwentyWords[num % 20] + " "
        } else if num < 100 {
            return tensWords[num / 10] + " " + helper(num: num % 10)
        } else {
            return zero2TwentyWords[num / 100] + " Hundred " + helper(num: num % 100)
        }
    }
    
}

/***
 12. Integer to Roman
 Medium

 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
 
 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.
 
 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
 
 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 Given an integer, convert it to a roman numeral. Input is guaranteed to be within the range from 1 to 3999.
 ***/

class Solution12x1 {
    func intToRoman(_ num: Int) -> String {
        var roman: String = ""
        var temp = num
        while temp >= 1000 {
            roman += "M"
            temp = temp - 1000
        }
        
        while temp >= 900 {
            roman += "CM"
            temp = temp - 900
        }
        
        while temp >= 500 {
            roman += "D"
            temp = temp - 500
        }
        
        while temp >= 400 {
            roman += "CD"
            temp = temp - 400
        }
        
        while temp >= 100 {
            roman += "C"
            temp = temp - 100
        }
        
        while temp >= 90 {
            roman += "XC"
            temp = temp - 90
        }
        
        while temp >= 50 {
            roman += "L"
            temp = temp - 50
        }
        
        while temp >= 40 {
            roman += "XL"
            temp = temp - 40
        }
        
        while temp >= 10 {
            roman += "X"
            temp = temp - 10
        }
        
        while temp >= 9 {
            roman += "IX"
            temp = temp - 9
        }
        
        while temp >= 5 {
            roman += "V"
            temp = temp - 5
        }
        
        while temp >= 4 {
            roman += "IV"
            temp = temp - 4
        }
        
        while temp >= 1 {
            roman += "I"
            temp = temp - 1
        }
        return roman
    }
}


class Solution12x2 {
    func intToRoman(_ num: Int) -> String {
        var M: [String] = ["", "M", "MM", "MMM"]
        var C: [String] = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
        var X: [String] = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
        var I: [String] = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
        
        return M[num/1000] + C[(num%1000)/100] + X[(num%100)/10] + I[num%10];
    }
}

class Solution12x3 {
    func intToRoman(_ num: Int) -> String {
        var res = ""
        var i = num
        let dk = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let d = [1: "I", 5: "V", 10: "X", 50: "L", 100: "C", 500: "D", 1000: "M", 4: "IV", 9: "IX", 40: "XL", 90: "XC", 400: "CD", 900: "CM"]
        
        while i > 0 {
            for div in dk {
                let kc = i / div
                guard kc > 0 else { continue }
                i -= (kc * div)
                res.append(String(repeating: d[div]!, count: kc))
            }
        }
        return res
    }
}

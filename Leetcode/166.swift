/***
 166. Fraction to Recurring Decimal
 Medium

 Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.
 
 If the fractional part is repeating, enclose the repeating part in parentheses.
 
 Example 1:
 
 Input: numerator = 1, denominator = 2
 Output: "0.5"
 Example 2:
 
 Input: numerator = 2, denominator = 1
 Output: "2"
 Example 3:
 
 Input: numerator = 2, denominator = 3
 Output: "0.(6)"
 ***/


class Solution166x1 {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        let s1 = numerator > 0 ? 1 : -1
        let s2 = denominator > 0 ? 1 : -1
        let numerator = abs(numerator)
        let denominator = abs(denominator)
        let num = numerator / denominator
        var remain = numerator % denominator
        var remains = [Int : Int]()
        var res = ""
        if s1*s2 < 0 && (num > 0 || remain > 0) {
            res += "-"
        }
        res += "\(num)"
        if remain > 0 {
            res += "."
        }
        var frac = ""
        var pos = 0
        while remain > 0 {
            if let pos = remains[remain] {
                frac.insert("(", at: frac.index(frac.startIndex, offsetBy: pos))
                frac += ")"
                return res+frac
            }
            remains[remain] = pos
            frac += String(remain*10 / denominator)
            remain = remain*10 % denominator
            pos += 1
        }
        return res+frac
    }
}


class Solution166x2 {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        
        if denominator == 0 { return "NaN" }
        
        //Big bad voodoo magic.
        var numerator = numerator
        var denominator = denominator
        
        //Note, for bools "!=" behaves the same as "^" which is not allowed.
        var negative = (numerator < 0) != (denominator < 0)
        
        numerator = abs(numerator)
        denominator = abs(denominator)
        
        var result = String(numerator / denominator)
        var remainder = (numerator % denominator) * 10
        
        if remainder == 0 {
            if negative == true && numerator != 0 {
                return String("-") + result
            } else {
                return result
            }
        }
        
        result += "."
        
        //See if we find repeating digits...
        //At the point where our long division keeps
        //dividing into the same NO, we loop 4evz
        var repeatMap = [Int:Int]()
        
        while remainder != 0 {
            
            //We got a repeater? Or nah?
            if let repeatIndex = repeatMap[remainder] {
                result.insert("(", at: result.index(result.startIndex, offsetBy: repeatIndex))
                result += ")"
                break
            }
            
            result += String(remainder / denominator)
            
            //Set our repeater..
            repeatMap[remainder] = result.count - 1
            
            //Perform one more step of long division
            remainder = (remainder % denominator) * 10
        }
        
        if negative == true {
            return String("-") + result
        }
        return result
    }
}


class Solution166x3 {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        
        if numerator  == 0 {
            return "0"
        }
        
        var res = ""
        
        if ((numerator < 0) && (denominator >= 0)) || ((numerator >= 0) && (denominator < 0)) {
            res += "-"
        }
        
        let absNum = abs(numerator)
        let absDen = abs(denominator)
        
        res += String(absNum/absDen)
        
        var remander = absNum % absDen
        
        if remander == 0 {
            return res
        }
        
        res += "."
        
        var remanders = [Int : Int]()
        
        var pos = res.count
        
        var add = 0
        var hasRecycyle = false
        
        while remander != 0 && !hasRecycyle {
            if remanders.keys.contains(remander) {
                add = remanders[remander]!
                hasRecycyle = true
                continue
            }
            
            remanders[remander] = pos
            pos += 1
            res += String(10 * remander / absDen)
            remander = (10 * remander) % absDen
        }
        
        if hasRecycyle {
            res.insert("(", at: res.index(res.startIndex, offsetBy: add))
            res += ")"
        }
        
        
        return res
    }
}


class Solution166x4 {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        var s1:Int = numerator >= 0 ? 1 : -1
        var s2:Int = denominator >= 0 ? 1 : -1
        var num:Int = abs(numerator )
        var den:Int = abs(denominator )
        var out:Int = num / den
        var rem:Int = num % den
        var m:[Int: Int] = [Int: Int]()
        var res:String = String(out)
        if s1 * s2 == -1 && (out > 0 || rem > 0)
        {
            res = "-" + res
        }
        if rem == 0 {return res}
        res += "."
        var s:String = ""
        var pos:Int = 0
        while(rem != 0)
        {
            if m[rem] != nil
            {
                var index = s.index(s.startIndex, offsetBy: m[rem]!)
                s.insert("(", at:index )
                s += ")"
                return res + s
            }
            m[rem] = pos
            s += String((rem * 10) / den)
            rem = (rem * 10) % den
            pos += 1
        }
        return res + s
    }
}

/***
 65. Valid Number
 Hard

 Validate if a given string can be interpreted as a decimal number.
 
 Some examples:
 "0" => true
 " 0.1 " => true
 "abc" => false
 "1 a" => false
 "2e10" => true
 " -90e3   " => true
 " 1e" => false
 "e3" => false
 " 6e-1" => true
 " 99e2.5 " => false
 "53.5e93" => true
 " --6 " => false
 "-+3" => false
 "95a54e53" => false
 
 Note: It is intended for the problem statement to be ambiguous. You should gather all requirements up front before implementing one. However, here is a list of characters that can be in a valid decimal number:
 
 Numbers 0-9
 Exponent - "e"
 Positive/negative sign - "+"/"-"
 Decimal point - "."
 Of course, the context of these characters also matters in the input.
 
 Update (2015-02-10):
 The signature of the C++ function had been updated. If you still see your function signature accepts a const char * argument, please click the reload button to reset your code definition.
 ***/


class Solution65x1 {
    func isNumber(_ s: String) -> Bool {
        let s = s.trimmingCharacters(in: .whitespaces)
        var pointSeen = false
        var eSeen = false
        var numSeen = false
        var numAfterE = true
        
        for i in 0..<s.count {
            if "0" <= s[i] && s[i] <= "9" {
                numSeen = true
                numAfterE = true
            } else if s[i] == "." {
                if eSeen || pointSeen {
                    return false
                }
                pointSeen = true
            } else if s[i] == "e" {
                if eSeen || !numSeen {
                    return false
                }
                numAfterE = false
                eSeen = true
            } else if s[i] == "-" || s[i] == "+" {
                if i != 0 && s[i - 1] != "e" {
                    return false
                }
            } else {
                return false
            }
        }
        
        return numSeen && numAfterE
    }
}

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript(_ range: CountableRange<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: max(0, range.lowerBound))
        let idx2 = index(startIndex, offsetBy: min(self.count, range.upperBound))
        return String(self[idx1..<idx2])
    }
}


class Solution65x2 {
    func isNumber(_ s: String) -> Bool {
        var num = Array(s.trimmingCharacters(in: .whitespacesAndNewlines))
        guard let first = num.first else {
            return false
        }
        
        if let e = num.index(of: "e") {
            if e > 0 && e < num.count - 1 {
                return isRealNumber(Array(num[0..<e])) && isInteger(Array(num[(e+1)...]))
            } else {
                return false
            }
        } else {
            return isRealNumber(num)
        }
    }
    
    func isDigitOnly(_ num: [Character]) -> Bool {
        return num.count > 0 && !num.contains { $0 < "0" || $0 > "9" }
    }
    
    func isInteger(_ num: [Character]) -> Bool {
        guard let first = num.first else {
            return false
        }
        
        if first == "+" || first == "-" {
            return isDigitOnly(Array(num[1...]))
        } else {
            return isDigitOnly(num)
        }
    }
    
    func isFloat(_ num: [Character]) -> Bool {
        guard num.count > 1 else {
            return false
        }
        
        if let dot = num.index(of: ".") {
            if dot == 1 && (num[0] == "+" || num[0] == "-") {
                return isDigitOnly(Array(num[(dot + 1)...]))
            }
            
            return (dot == 0 || isInteger(Array(num[0 ..< dot])))
                && (dot == num.count - 1 || isDigitOnly(Array(num[(dot + 1)...])))
        } else {
            return false
        }
    }
    
    func isRealNumber(_ num: [Character]) -> Bool {
        return isInteger(num) || isFloat(num)
    }
}



class Solution65x3 {
    func isNumber(_ s: String) -> Bool {
        //initialize
        var s = s.map{ String($0) }
        var i = 0
        var n = s.count
        var isValid = false
        //analyze
        //" " in front
        while i < n && s[i] == " " {
            i += 1
        }
        //"+/-"
        while i < n && (s[i] == "+" || s[i] == "-") {
            i += 1
        }
        //valid number
        while i < n && Int(s[i]) != nil {
            isValid = true
            i += 1
        }
        //"."
        if i < n && s[i] == "." {
            i += 1
            //check for valid number
            while i < n && Int(s[i]) != nil {
                isValid = true
                i += 1
            }
        }
        //"e"
        if i < n && isValid && s[i] == "e" {
            isValid = false
            i += 1
            //"+/-"
            while i < n && (s[i] == "+" || s[i] == "-") {
                i += 1
            }
            //check for valid numbers
            while i < n && Int(s[i]) != nil {
                isValid = true
                i += 1
            }
        }
        //check for " " in end
        while i < n && s[i] == " " {
            i += 1
        }
        return isValid && i == n
    }
}


class Solution65x4 {
    
    func isNumber(_ s: String) -> Bool {
        let trimmed = s.trimmingCharacters(in: .whitespaces)
        guard trimmed.count > 0 else { return false }
        if let index = Array(trimmed).index(of: "e"), (index == 0 || index == trimmed.count-1) {
            return false
        }
        let c = trimmed.trimmingCharacters(in: .whitespaces).components(separatedBy: "e")
        if let index = c.index(of: "e"), (index == 0 || index == c.count-1) {
            return false
        }
        switch c.count {
        case 1 : return isValidFloating(c[0])
        case 2 : return isValidFloating(c[0]) && isValidInteger(c[1])
        default: return false
        }
    }
    
    func isValidInteger(_ s: String) -> Bool {
        guard s.count > 0 else { return true }
        let s = Array(s).map{String($0)}
        guard s.count > 1 else { return Int(s[0]) != nil && s[0] != "-" && s[0] != "+" }
        if Int(s[0]) == nil && s[0] != "-" && s[0] != "+" {
            return false
        }
        for i in 1..<s.count {
            if Int(s[i]) == nil { return false }
        }
        return true
    }
    
    func isValidFloating(_ s: String) -> Bool {
        guard s.count > 0 else { return false }
        let s = Array(s).map{String($0)}
        guard s.count > 1 else { return Int(s[0]) != nil && s[0] != "-" && s[0] != "+" && s[0] != "." }
        if Int(s[0]) == nil && s[0] != "-" && s[0] != "+" && s[0] != "." {
            return false
        }
        var foundPoint = s[0] == "."
        var foundDigit = Int(s[0]) != nil
        for i in 1..<s.count {
            if s[i] == "." {
                if foundPoint { return false }
                foundPoint = true
            } else if Int(s[i]) == nil {
                return false
            } else {
                foundDigit = true
            }
        }
        return foundDigit
    }
}




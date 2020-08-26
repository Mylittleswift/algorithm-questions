/***
 187. Repeated DNA Sequences
 Medium

 All DNA is composed of a series of nucleotides abbreviated as A, C, G, and T, for example: "ACGAATTCCG". When studying DNA, it is sometimes useful to identify repeated sequences within the DNA.
 
 Write a function to find all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule.
 
 Example:
 
 Input: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
 
 Output: ["AAAAACCCCC", "CCCCCAAAAA"]
 ***/



class Solution187x1 {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count >= 10 else {
            return []
        }
        var characters = Array(s)
        var result = Set<String>()
        var dic = [Int : Int]()
        var map: [Character : Int] = ["A" : 0, "C" : 1, "G" : 2, "T" : 3]
        var cur = 0, i = 0
        while i < 9 {
            let num = map[characters[i]]!
            cur = cur << 2 | (num & 3)
            i += 1
        }
        let count = s.count
        while i < count {
            let num = map[characters[i]]!
            cur = ((cur & 0x3ffff) << 2) | (num & 3)
            i += 1
            if let _ = dic[cur] {
                let startIndex = s.index(s.startIndex, offsetBy: i - 10)
                let endIndex = s.index(s.startIndex, offsetBy: i)
                result.insert(String(s[startIndex..<endIndex]))
            } else {
                dic[cur] = 1
            }
        }
        return Array(result)
    }
}


class Solution187x2 {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        
        guard s.count >= 10 else { return [] }
        
        var m = [Int: Int]()
        var res = [String]()
        var charDict: [Character: Int] = ["A": 0, "C" : 1, "G" : 2, "T" : 3]
        var base = 256*256*4 //pow(4, 9)
        var chars = Array(s)
        var num = 0
        for i in 0..<9 {
            num *= 4
            num += (charDict[chars[i]] ?? 0 )
        }
        for i in 9..<chars.count {
            num %= base
            num *= 4
            num += (charDict[chars[i]] ?? 0 )
            
            m[num, default:0] += 1
            if m[num, default:0] == 2 {
                res.append(String(chars[i-9...i]))
            }
        }
        return res
    }
}

extension String {
    func substring(_ i: Int, _ len: Int) -> String {
        var startInd = index(startIndex, offsetBy: i)
        var endInd = index(startIndex, offsetBy: i+len)
        return String(self[startInd..<endInd])
    }
}


class Solution187x3 {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count >= 10 else { return [] }
        let chars = Array(s)
        
        var (seen, repeated) = (Set<String>(), Set<String>())
        
        for i in 0 ..< (chars.count - 9) {
            let cur = String(chars[i ... (i + 9)])
            if !seen.insert(cur).inserted {
                repeated.insert(cur)
            }
        }
        
        return Array(repeated)
    }
}


class Solution187x4 {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        let array = Array(s)
        var map: Dictionary<String, Int> = [:]
        var result: [String] = []
        
        if (array.count <= 10) {
            return []
        }
        
        for i in 0 ..< array.count - 9 {
            let str = String(array[i ..< i + 10])
            
            if let count = map[str] {
                if (count == 1) {
                    result.append(str)
                }
                map[str] = count + 1
            } else {
                map[str] = 1
            }
        }
        
        return result
    }
}

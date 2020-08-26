/***
 17. Letter Combinations of a Phone Number
 Medium

 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.
 
 A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
 
 
 
 Example:
 
 Input: "23"
 Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 Note:
 
 Although the above answer is in lexicographical order, your answer could be in any order you want.
 ***/


class Solution17x1 {
    let strings: [String] = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
    func letterCombinations(_ digits: String) -> [String] {
        var res = [String]()
        if digits.isEmpty {return res}
        //回溯法
        backtracking("", digits, 0, &res)
        return res
    }
    
    func backtracking(_ s: String, _ digits: String, _ flag: Int, _ res: inout[String]) {
        //如果已经遍历完所有输入的数字，说明已经到达底部，需要向上溯源。
        if flag >= digits.count {
            //到达底部说明已经是完整的一个结果，则将此次结果添加到结果集中
            res.append(s)
            //返回，向上回溯
            return
        }
        //0的ASCII:48
        let chars = strings[digits.toInt(flag) - 48]
        for char in chars {
            let str:String = s + String(char)
            backtracking(str, digits, flag + 1, &res)
        }
    }
}

extension String {
    //获取指定索引位置的字符，返回为字符串形式
    func charAt(_ num: Int) -> String {
        guard num < self.count else {
            assertionFailure("index out of range!")
            return String()
        }
        let index = self.index(self.startIndex, offsetBy: num)
        return String(self[index])
    }
    
    //获取指定索引位置字符的ASCII整数值
    func toInt(_ num: Int) -> Int {
        guard num < self.count else {
            assertionFailure("index out of range!")
            return 0
        }
        var number = Int()
        for scalar in charAt(num).unicodeScalars {
            number = Int(scalar.value)
        }
        return number
    }
}


class Solution17x2 {
    func letterCombinations(_ digits: String) -> [String] {
        let dict:[Character: [String]] =
            [
                "2": ["a", "b", "c"],
                "3": ["d", "e", "f"],
                "4": ["g", "h", "i"],
                "5": ["j", "k", "l"],
                "6": ["m", "n", "o"],
                "7": ["p", "q", "r", "s"],
                "8": ["t", "u", "v"],
                "9": ["w", "x", "y", "z"],
            ]
        
        if digits.isEmpty {
            return [String]()
        }
        if digits.count == 1 {
            return dict[Character(digits)]!
        }
        var nextComb = letterCombinations(String(digits.dropFirst()))
        let current = dict[digits[digits.startIndex]]!
        var result = [String]()
        for c in current {
            for i in 0..<nextComb.count {
                result.append(String(c) + nextComb[i])
            }
        }
        return result
    }
}


class Solution17x3 {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty == true {
            return []
        }
        
        var result: [String] = []
        // let chars = digits.characters
        let hash: [String: [String]] = ["2": ["a", "b", "c"],
                                        "3": ["d", "e", "f"],
                                        "4": ["g", "h", "i"],
                                        "5": ["j", "k", "l"],
                                        "6": ["m", "n", "o"],
                                        "7": ["p", "q", "r", "s"],
                                        "8": ["t", "u", "v"],
                                        "9": ["w", "x", "y", "z"]]
        
        letterCombinationsHelper(digits, hash, &result, "")
        
        return result
    }
    
    func letterCombinationsHelper(_ chars: String,
                                  _ hash: [String: [String]],
                                  _ result: inout [String], _ current: String) {
        let count = chars.count
        if count == 0 {
            result.append(current)
            return
        }
        
        let sub = String(chars[chars.index(chars.startIndex, offsetBy: 0)])
        let newList = hash[sub] ?? []
        for item in newList {
            if count >= 1 {
                let suubbb = String(chars[chars.index(chars.startIndex, offsetBy: 1)...])
                letterCombinationsHelper(suubbb, hash, &result, current + item)
            } else {
                letterCombinationsHelper("", hash, &result, current + item)
            }
        }
    }
}


class Solution17X4 {
    func letterCombinations(_ digits: String) -> [String] {
        var combinations = [String](), combination = ""
        dfs(creatBoard(), &combinations, &combination, Array(digits), 0)
        return combinations
    }
    
    fileprivate func dfs(_ board: [String], _ combinations: inout [String], _ combination: inout String, _ digits: [Character], _ index: Int) {
        if digits.count == index {
            if combination != "" {
                combinations.append(String(combination))
            }
            
            return
        }
        
        let digitStr = board[Int(String(digits[index]))!]
        for digitChar in digitStr {
            combination.append(digitChar)
            dfs(board, &combinations, &combination, digits, index + 1)
            combination.removeLast()
        }
    }
    
    
    fileprivate func creatBoard() -> [String] {
        var res = [String]()
        
        res.append("")
        res.append("")
        res.append("abc")
        res.append("def")
        res.append("ghi")
        res.append("jkl")
        res.append("mno")
        res.append("pqrs")
        res.append("tuv")
        res.append("wxyz")
        
        return res
    }
}


class Solution17X5 {
    private let keys = [" ", "*", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
    
    func letterCombinations(_ digits: String) -> [String] {
        
        if digits.count == 0 {
            return []
        }
        
        var answer = [String]()
        
        let number = Array(digits)
        
        addCombinations(number, 0, &answer, "")
        
        return answer
    }
    
    
    func addCombinations(_ number: [Character], _ n: Int, _ answer: inout [String], _ char: String) {
        
        //base case when we reach the end of the key number letters
        if n >= number.count {
            //add this to the answe
            answer.append(char)
            return
        }
        
        let digit = Int(String(number[n]))
        
        let key = keys[digit!]
        
        for k in key {
            addCombinations(number, n + 1, &answer, char + String(k))
        }
    }
}


class Solution17X6 {
    func letterCombinations(_ digits: String) -> [String] {
        
        if digits.count == 0 {
            return []
        }
        let dic:[Character:String] = ["2":"abc","3":"def","4":"ghi","5":"jkl","6":"mno","7":"pqrs","8":"tuv","9":"wxyz"]
        var res = [String]()
        var path = [Character]()
        let digits = Array(digits)
        dfs(&res,&path,dic,digits,0)
        
        return res
    }
    
    func dfs(_ res:inout [String], _ path: inout [Character], _ dic:[Character:String], _ digits: [Character], _ idx:Int) {
        if path.count == digits.count {
            res.append(String(path))
            return
        }
        
        if idx < digits.count {
            if let letters = dic[digits[idx]] {
                let chars = Array(letters)
                
                for j in 0 ..< chars.count {
                    path.append(chars[j])
                    dfs(&res,&path,dic,digits,idx+1)
                    path.removeLast()
                }
            }
        }
    }
}

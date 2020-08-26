/***
 282. Expression Add Operators
 Hard

 Given a string that contains only digits 0-9 and a target value, return all possibilities to add binary operators (not unary) +, -, or * between the digits so they evaluate to the target value.
 
 Example 1:
 
 Input: num = "123", target = 6
 Output: ["1+2+3", "1*2*3"]
 Example 2:
 
 Input: num = "232", target = 8
 Output: ["2*3+2", "2+3*2"]
 Example 3:
 
 Input: num = "105", target = 5
 Output: ["1*0+5","10-5"]
 Example 4:
 
 Input: num = "00", target = 0
 Output: ["0+0", "0-0", "0*0"]
 Example 5:
 
 Input: num = "3456237490", target = 9191
 Output: []
 ***/


class Solution282 {
    func addOperators(_ num: String, _ target: Int) -> [String] {
        let numArr = Array(num)
        var res = [String]()
        
        opeHelp(numArr, 0, 0, 0, "", &res, target)
        
        return res
    }
    
    func opeHelp(_ numArr : [Character],_ total : Int,_ last : Int , _ index : Int,_ str : String, _ res : inout [String], _ target : Int) {
        if index == numArr.count {
            if total == target {
                res.append(str)
            }
            return
        }
        
        for i in index+1...numArr.count {
            let tmp = String(numArr[index..<i])
            let count = tmp.count
            if count > 1 && numArr[index] == "0" {
                continue
            }
            
            let n = Int(tmp)!
            
            if index == 0 {
                opeHelp(numArr, total + n, n,i, str + tmp, &res, target)
                continue
            }
            
            opeHelp(numArr, total + n, n,i, str + "+" + tmp, &res, target)
            opeHelp(numArr, total - n, -n,i, str + "-" + tmp, &res, target)
            opeHelp(numArr, (total - last) + last * n, last * n, i,str + "*" + tmp, &res, target)
        }
        
    }
}

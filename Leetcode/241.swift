/***
 241. Different Ways to Add Parentheses
 Medium

 Given a string of numbers and operators, return all possible results from computing all the different possible ways to group numbers and operators. The valid operators are +, - and *.
 
 Example 1:
 
 Input: "2-1-1"
 Output: [0, 2]
 Explanation:
 ((2-1)-1) = 0
 (2-(1-1)) = 2
 Example 2:
 
 Input: "2*3-4*5"
 Output: [-34, -14, -10, -10, 10]
 Explanation:
 (2*(3-(4*5))) = -34
 ((2*3)-(4*5)) = -14
 ((2*(3-4))*5) = -10
 (2*((3-4)*5)) = -10
 (((2*3)-4)*5) = 10
 ***/



class Solution241x1 {
    func diffWaysToCompute(_ input: String) -> [Int] {
        let sarr = Array(input)
        var res = [Int]()
        for i in 0..<sarr.count {
            let c = sarr[i]
            if c == "+" || c == "-" || c == "*" {
                let res1 = diffWaysToCompute(String(sarr[0..<i]))
                let res2 = diffWaysToCompute(String(sarr[i+1..<sarr.count]))
                for r1 in res1 {
                    for r2 in res2 {
                        if c == "+" {
                            res.append(r1 + r2)
                        }else if c == "-" {
                            res.append(r1 - r2)
                        }else if c == "*" {
                            res.append(r1 * r2)
                        }
                    }
                }
            }
        }
        if res.isEmpty {
            res.append(Int(input)!)
        }
        return res
    }
}



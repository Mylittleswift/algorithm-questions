/***
 274. H-Index
 Medium

 Given an array of citations (each citation is a non-negative integer) of a researcher, write a function to compute the researcher's h-index.
 
 According to the definition of h-index on Wikipedia: "A scientist has index h if h of his/her N papers have at least h citations each, and the other N − h papers have no more than h citations each."
 
 Example:
 
 Input: citations = [3,0,6,1,5]
 Output: 3
 Explanation: [3,0,6,1,5] means the researcher has 5 papers in total and each of them had
 received 3, 0, 6, 1, 5 citations respectively.
 Since the researcher has 3 papers with at least 3 citations each and the remaining
 two with no more than 3 citations each, her h-index is 3.
 Note: If there are several possible values for h, the maximum one is taken as the h-index.
 ***/



class Solution274x1 {
    func hIndex(_ citations: [Int]) -> Int {
        let arr = citations.sorted { (num1, num2) -> Bool in
            return num1 < num2
        }
        for i in 0 ..< arr.count {
            if arr[i] >= arr.count - i {
                return arr.count - i
            }
        }
        
        return 0
    }
}


class Solution274x2 {
    func hIndex(_ citations: [Int]) -> Int {
        if citations.isEmpty {
            return 0
        }
        let n = citations.count
        var res = Array(repeating: 0, count: n + 1)
        
        for i in citations {
            if i > n{
                res[n] += 1
            }else {
                res[i] += 1
            }
        }
        
        for i in stride(from: n, to: 0, by: -1) {
            if res[i] >= i {
                return i
            }
            res[i-1] += res[i]
        }
        
        
        return 0
    }
}


class Solution274x3 {
    func hIndex(_ citations: [Int]) -> Int {
        guard citations.count > 0 else {
            return 0
        }
        let res = citations.sorted()
        for (index,value) in res.enumerated() {
            if value >= (res.count - index){
                return res.count - index
            }
        }
        return 0
    }
}

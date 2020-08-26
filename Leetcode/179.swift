/***
 179. Largest Number
 Medium

 Given a list of non negative integers, arrange them such that they form the largest number.
 
 Example 1:
 
 Input: [10,2]
 Output: "210"
 Example 2:
 
 Input: [3,30,34,5,9]
 Output: "9534330"
 Note: The result may be very large, so you need to return a string instead of an integer.
 ***/




class Solution179x1 {
    func largestNumber(_ nums: [Int]) -> String {
        var arr = nums.compactMap{ return String($0) }
        arr.sort{ return $0 + $1 > $1 + $0 }
        while arr.count > 1 && arr[0] == "0" {
            arr.removeFirst()
        }
        return arr.joined(separator: "")
    }
}


class Solution179x2 {
    func largestNumber(_ nums: [Int]) -> String {
        let s = nums.map({ (i) -> String in
            "\(i)"
        }).sorted { (i, j) -> Bool in
            (i + j) > (j + i)
        }
        if s.count == 0 || s[0] == "0" {
            return "0"
        }
        return s.reduce("") { (res, t) -> String in
            res + t
        }
    }
}

class Solution179x3 {
    func largestNumber(_ nums: [Int]) -> String {
        let strs = nums.map{"\($0)"}.sorted { (str1, str2) -> Bool in
            return str1 + str2 > str2 + str1
        }
        let s = strs.joined()
        if(s.first != "0"){ return s }
        return "0"
    }
}

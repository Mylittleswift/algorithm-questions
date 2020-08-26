/***
 228. Summary Ranges
 Medium

 Given a sorted integer array without duplicates, return the summary of its ranges.
 
 Example 1:
 
 Input:  [0,1,2,4,5,7]
 Output: ["0->2","4->5","7"]
 Explanation: 0,1,2 form a continuous range; 4,5 form a continuous range.
 Example 2:
 
 Input:  [0,2,3,4,6,8,9]
 Output: ["0","2->4","6","8->9"]
 Explanation: 2,3,4 form a continuous range; 8,9 form a continuous range.
 ***/




class Solution228x1 {
    func summaryRanges(_ nums: [Int]) -> [String] {
        
        var resultArr = [String]()
        var tempValue = 0
        for (index ,value) in nums.enumerated() {
            var tempStr = "\(value)"
            if index == 0 {
                tempValue = value
                resultArr.append(tempStr)
            }else{
                if value == nums[index - 1] + 1 {
                    tempStr = "\(tempValue)->\(value)"
                    resultArr.removeLast()
                    resultArr.append(tempStr)
                }else{
                    tempValue = value
                    resultArr.append(tempStr)
                }
            }
            
        }
        return resultArr
    }
}


class Solution228x2 {
    func summaryRanges(_ nums: [Int]) -> [String] {
        if nums.count < 1 {
            return []
        }
        var ans = [String]()
        var first = nums[0]
        var lastV = first
        for i in 1..<nums.count {
            let cv = nums[i]
            if cv - lastV > 1 {
                let str = (lastV == first) ? "\(first)" : "\(first)->\(lastV)"
                ans.append(str)
                first = cv
            }
            lastV = cv
        }
        let str = (lastV == first) ? "\(first)" : "\(first)->\(lastV)"
        ans.append(str)
        return ans
    }
}



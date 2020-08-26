/***
163. Missing Ranges
Medium
 
 
 Given a sorted integer array nums, where the range of elements are in the inclusive range [lower, upper], return its missing ranges.
 
 Example:
 
 Input: nums = [0, 1, 3, 50, 75], lower = 0 and upper = 99,
 Output: ["2", "4->49", "51->74", "76->99"]
***/


class Solution163 {
    func findMissingRanges(_ nums:[Int] ,_ lower:Int,_ upper:Int) -> [String]{
        var res:[String] = [String]()
        var l:Int = lower
        for i in 0...nums.count
        {
            var r:Int = (i < nums.count && nums[i] <= upper) ? nums[i] : upper + 1
            if l == r
            {
                l += 1
            }
            else if r > l
            {
                res.append(r - l == 1 ? String(l):String(l) + "->" + String(r - 1))
                l = r + 1
            }
        }
        return res
    }
}

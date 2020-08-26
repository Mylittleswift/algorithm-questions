/***
 56. Merge Intervals
 Medium

 Given a collection of intervals, merge all overlapping intervals.
 
 Example 1:
 
 Input: [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 Example 2:
 
 Input: [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
 ***/



// Definition for an interval.
public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
   }
}
 
class Solution56x1 {
    func merge(_ intervals: [Interval]) -> [Interval] {
        guard !intervals.isEmpty else {
            return []
        }
        
        var intervals = intervals
        var index = 1
        while index < intervals.count {
            let interval = intervals[index]
            var left = 0
            var right = index
            while left < right {
                let leftInterval = intervals[left]
                if interval.end < leftInterval.start || interval.start > leftInterval.end {
                    left += 1
                    continue
                }
                
                interval.start = min(leftInterval.start, interval.start)
                interval.end = max(leftInterval.end, interval.end)
                intervals.remove(at: left)
                right -= 1
                index -= 1
            }
            
            index += 1
        }
        return intervals
    }
}



class Solution56x2 {
    func merge(_ intervals: [Interval]) -> [Interval] {
        let count = intervals.count
        guard count > 0 else {
            return [Interval]()
        }
        
        var intervals = intervals.sorted { (intervalL, intervalR) -> Bool in
            intervalL.start < intervalR.start
        }
        
        var left = intervals[0].start
        var right = intervals[0].end
        var result = [Interval]()
        for i in 1..<count {
            if intervals[i].start <= right {
                right = max(right, intervals[i].end)
            } else {
                result.append(Interval.init(left, right))
                left = intervals[i].start
                right = intervals[i].end
            }
        }
        result.append(Interval.init(left, right))
        return result
    }
}



class Solution56x3 {
    func merge(_ intervals: [Interval]) -> [Interval] {
        if intervals.count < 2 {
            return intervals
        }
        //排序
        let newIner = intervals.sorted { (inter1, inter2) -> Bool in
            return inter1.start < inter2.start
        }
        
        var results = [Interval]()//结果
        results.append(newIner[0])
        for (i,inter) in newIner.enumerated() {
            if i == 0 {
                continue
            }
            let result = results.last!
            if inter.start <= result.end {//有重叠
                result.end = max(result.end, inter.end)
            } else {
                results.append(inter)
            }
        }
        return results
    }
}



class Solution56x4 {
    func merge(_ intervals: [Interval]) -> [Interval] {
        var ivs = intervals
        
        if ivs.count <= 1 {
            return ivs
        }
        
        ivs.sort { $0.start < $1.start }
        
        var res = [Interval]()
        
        for interval in ivs {
            if res.isEmpty || (interval.start > res.last!.end) {
                
                res.append(interval)
                
            } else {
                res.last!.end = max(res.last!.end, interval.end)
            }
        }
        
        return res
    }
}

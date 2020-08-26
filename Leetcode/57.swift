/***
 57. Insert Interval
 Hard

 Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).
 
 You may assume that the intervals were initially sorted according to their start times.
 
 Example 1:
 
 Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
 Output: [[1,5],[6,9]]
 Example 2:
 
 Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
 Output: [[1,2],[3,10],[12,16]]
 Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
 NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
 ***/



/**
 * Definition for an interval.
 * public class Interval {
 *   public var start: Int
 *   public var end: Int
 *   public init(_ start: Int, _ end: Int) {
 *     self.start = start
 *     self.end = end
 *   }
 * }
 */
class Solution57x1 {
    
    func merge(_ intervals: [Interval]) -> [Interval] {
        
        let intervalsSorted =  intervals.sorted(by: { $0.start < $1.start } )
        
        var theIntervals = [Interval]()
        
        
        for interval in intervalsSorted  {
            
            if (theIntervals.count == 0 || theIntervals.last!.end <  interval.start) {
                theIntervals.append(interval)
            }
                // merge
            else {
                
                theIntervals.last!.end = max(theIntervals.last!.end, interval.end)
            }
            
        }
        
        return theIntervals
    }
    
    func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
        if (intervals.count == 0) {
            var theIntervals = intervals
            theIntervals.append(newInterval)
            return theIntervals
        }
        
        if (newInterval.end < intervals.first!.start) {
            var theIntervals = intervals
            theIntervals.insert(newInterval, at: 0)
            return theIntervals
        }
        
        if (newInterval.start > intervals.last!.end) {
            var theIntervals = intervals
            theIntervals.append(newInterval)
            return theIntervals
        }
        
        var theIntervals = [Interval]()
        var begin = 0
        var end = 0
        var insert = 0
        var i = 0
        while ( i < intervals.count  && intervals[i].end < newInterval.start) {
            theIntervals.append(intervals[i])
            i += 1
        }
        
        var theInterval = Interval(newInterval.start, newInterval.end)
        while (i < intervals.count  && intervals[i].start <= newInterval.end) {
            theInterval.start = min(theInterval.start, intervals[i].start)
            theInterval.end = max(theInterval.end, intervals[i].end)
            i += 1
        }
        theIntervals.append(theInterval)
        
        while ( i < intervals.count  && intervals[i].start > newInterval.end) {
            theIntervals.append(intervals[i])
            i += 1
        }
        
        return theIntervals
    }
}



class Solution57x2 {
    func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
        
        var right = newInterval.end
        var left = newInterval.start
        var ans = intervals
        for i in stride(from:ans.count - 1,through:0,by:-1) {
            if ans[i].start > newInterval.end || ans[i].end < newInterval.start {
                continue
            } else {
                right = max(right,ans[i].end)
                left = min(left,ans[i].start)
                ans.remove(at:i)
            }
        }
        for (index,inter) in ans.enumerated() {
            if inter.start > right {
                ans.insert(Interval(left,right),at:index)
                break
            } else if index == ans.count - 1 {
                ans.append(Interval(left,right))
            }
        }
        
        if ans.count == 0 {
            return [Interval(left,right)]
        }
        
        return ans
    }
}



class Solution57x3 {
    func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
        var result = [Interval]()
        
        guard intervals.count>0 else {
            result.append(newInterval)
            return result
        }
        
        result.append(newInterval)
        
        for i in 0..<intervals.count {
            var interval1 = result.removeLast()
            var interval2 = intervals[i]
            var cond1 = interval2.end >= interval1.start && interval2.start <= interval1.end
            if(cond1) {
                var start = min(interval1.start,interval2.start)
                var end = max(interval1.end,interval2.end)
                var newInterval = Interval(start,end)
                
                result.append(newInterval)
            }
            else {
                if(interval1.start<interval2.start) {
                    result.append(interval1)
                    result.append(interval2)
                }
                else {
                    result.append(interval2)
                    result.append(interval1)
                }
            }
        }
        
        return result
    }
}


class Solution57x4 {
    func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
        var ans = [Interval]()
        var i = 0
        var insertInterval = Interval(newInterval.start,newInterval.end)
        while i < intervals.count {
            if intervals[i].end >= newInterval.start { break }
            ans.append(intervals[i])
            i += 1
        }
        while i < intervals.count {
            if intervals[i].start <= newInterval.start && intervals[i].end >= newInterval.start {
                insertInterval.start = min(insertInterval.start,intervals[i].start)
            }
            if intervals[i].end >= newInterval.end && intervals[i].start <= newInterval.end {
                insertInterval.end = max(insertInterval.end,intervals[i].end)
                i += 1
                break
            }
            if intervals[i].start > newInterval.end {
                break
            }
            i += 1
        }
        
        ans.append(insertInterval)
        while i < intervals.count {
            ans.append(intervals[i])
            i += 1
        }
        
        return ans
    }
}



class Solution57x5 {
    func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
        guard intervals.count > 0 else {
            return [newInterval]
        }
        var newIntervals = [Interval](intervals)
        newIntervals.append(newInterval)
        newIntervals.sort{$0.start<$1.start}
        var previousOne = newIntervals[0]
        var result = [Interval]()
        
        for i in 1..<newIntervals.count {
            let currentOne = newIntervals[i]
            if previousOne.end >= currentOne.start {
                previousOne = Interval(previousOne.start, max(previousOne.end, currentOne.end))
            } else {
                result.append(previousOne)
                previousOne = currentOne
            }
        }
        
        result.append(previousOne)
        return result
    }
}

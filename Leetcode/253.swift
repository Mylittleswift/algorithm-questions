/***
 253 LeetCode Java: Meeting Rooms
 Medium
 
 Problem:
 Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],…] (si < ei), find the minimum number of conference rooms required.
 For example, Given [[0, 30],[5, 10],[15, 20]], return 2.
 ***/



class Solution253 {
    func canAttendMeetings(_ intervals:[[Int]]) -> Int {
        var intervals = intervals
        intervals.sort(by: {(arr1:[Int],arr2:[Int]) -> Bool in
            return arr1.first! < arr2.first!})
        var q:[Int] = [Int]()
        for a in intervals
        {
            if !q.isEmpty && q.last! <= a.first!
            {
                for (index, value) in q.enumerated()
                {
                    if q.min() == value
                    {
                        q.remove(at: index)
                        break
                    }
                }
            }
            q.append(a.last!)
        }
        return q.count
    }
}

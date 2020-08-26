/***
 252 Meeting Rooms II
 Easy
 
 Problem:
 Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],…] (si < ei), determine if a person could attend all meetings.
 For example, Given [[0, 30],[5, 10],[15, 20]], return false.
 ***/



class Solution252 {
    func canAttendMeetings(_ intervals:[[Int]]) -> Bool {
        var intervals = intervals
        intervals.sort(by: {(arr1:[Int],arr2:[Int]) -> Bool in
            return arr1.first! < arr2.first!})
        for i in 1..<intervals.count
        {
            if intervals[i].first! < intervals[i - 1].last!
            {
                return false
            }
        }
        return true
    }
}

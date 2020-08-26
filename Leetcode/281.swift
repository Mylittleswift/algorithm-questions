/***
 281. Zigzag Iterator
 Medium
 
 Problem:
 Given two 1d vectors, implement an iterator to return their elements alternately.
 
 For example, given two 1d vectors:
 
 v1 = [1, 2]
 v2 = [3, 4, 5, 6]
 By calling next repeatedly until hasNext returns false, the order of elements returned by next should be: [1, 3, 2, 4, 5, 6].
 
 Follow up: What if you are given k 1d vectors? How well can your code be extended to such cases?
 
 Clarification for the follow up question - Update (2015-09-18):
 The "Zigzag" order is not clearly defined and is ambiguous for k > 2 cases. If "Zigzag" does not look right to you, replace "Zigzag" with "Cyclic". For example, given the following input:
 
 [1,2,3]
 [4,5,6,7]
 [8,9]
 It should return [1,4,8,2,5,9,3,6,7].
 ***/


class ZigzagIterator {
    var v:[Int] = [Int]()
    var i:Int = 0
    init(_ v1:[Int],_ v2:[Int])
    {
        var n1:Int = v1.count
        var n2:Int = v2.count
        let n:Int = max(n1, n2)
        for i in 0..<n
        {
            if i < n1 {v.append(v1[i])}
            if i < n2 {v.append(v2[i])}
        }
    }
    
    func next() -> Int
    {
        let num:Int = v[i]
        i += 1
        return num
    }
    
    func hasNext() -> Bool
    {
        return i < v.count
    }
}

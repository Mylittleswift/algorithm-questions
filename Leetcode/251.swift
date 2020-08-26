/***
 251 Flatten 2D Vector
 Medium
 
 Problem:
 Implement an iterator to flatten a 2d vector.
 
 For example, Given 2d vector =
 [
 [1,2],
 [3],
 [4,5,6]
 ]
 
 By calling next repeatedly until hasNext returns false, the order of elements returned by next should be: [1,2,3,4,5,6].
 
 Follow up: As an added challenge, try to code it using only iterators in C++ or iterators in Java.
 ***/



class WordDistance251 {
    var x:Int
    var y:Int
    var v:[[Int]] = [[Int]]()
    init(_ vec2d:[[Int]]) {
        // perform some initialization here
        v = vec2d
        x = 0
        y = 0
    }
    
    func next() -> Int
    {
        var num:Int = v[x][y]
        y += 1
        return num
    }
    
    func hasNext() -> Bool
    {
        while (x < v.count && y == v[x].count) {
            x += 1
            y = 0
        }
        return x < v.count
    }
}

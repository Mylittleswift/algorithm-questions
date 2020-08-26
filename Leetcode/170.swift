/***
 170. Two Sum III - Data structure design
 Easy
 
 Design and implement a TwoSum class. It should support the following operations:add and find.
 
 add - Add the number to an internal data structure.
 find - Find if there exists any pair of numbers which sum is equal to the value.
 
 For example,
 
 add(1); add(3); add(5);
 find(4) -> true
 find(7) -> false
***/


class Solution170x1 {
    var s:[Int] = [Int]()
    func add(_ number:Int)
    {
        s.append(number)
    }
    
    func find(_ value:Int) -> Bool
    {
        for a in s
        {
            var cnt:Int = 0
            if a == (value - a)
            {
                cnt = 1
            }
            else
            {
                cnt = 0
            }
            if count(value - a) > cnt
            {
                return true
            }
        }
        return false
    }
    
    //统计某个值出现的次数
    func count(_ num:Int) -> Int
    {
        var number:Int = 0
        for i in s
        {
            if num == i
            {
                number += 1
            }
        }
        return number
    }
}

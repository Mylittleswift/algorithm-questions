/***
 Leetcode 248 Strobogrammatic Number III
 Hard
 
 A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).
 Write a function to count the total strobogrammatic numbers that exist in the range of low <= num <= high.
 For example,
 Given low = "50", high = "100", return 3. Because 69, 88, and 96 are three strobogrammatic numbers.
 Note:
 Because the range might be a large number, the low and high numbers are represented as string.
 ***/



class Solution248x1 {
    func strobogrammaticInRange(_ low:String,_ high:String) -> Int {
        var res:Int = 0
        find(low, high, "",  &res)
        find(low, high, "0", &res)
        find(low, high, "1", &res)
        find(low, high, "8", &res)
        return res;
    }
    
    func find (_ low:String,_ high:String,_ w:String,_ res:inout Int)
    {
        if w.count >= low.count && w.count <= high.count
        {
            if (w.count == low.count && w < low) || (w.count == high.count && w > high)
            {
                return
            }
            if !(w.count > 1 && w[0] == "0")
            {
                res += 1
            }
        }
        if w.count + 2 > high.count
        {
            return
        }
        find(low, high, "0" + w + "0", &res)
        find(low, high, "1" + w + "1", &res)
        find(low, high, "6" + w + "9", &res)
        find(low, high, "8" + w + "8", &res)
        find(low, high, "9" + w + "6", &res)
    }
}


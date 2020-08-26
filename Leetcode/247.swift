/***
 247 LeetCode Java: Strobogrammatic Number II – Medium

 Problem:
 A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).
 
 Find all strobogrammatic numbers that are of length = n.
 
 For example,
 Given n = 2, return [“11″,”69″,”88″,”96”].
 
 Hint:
 
 Try to use recursion and notice that it should recurse with n – 2 instead of n – 1.
 ***/



class Solution247 {
    func shortest(_ n:Int) -> [String] {
        var one:[String] = ["0","1","8"]
        var two:[String] = [""]
        var res:[String] = two
        if n % 2 == 1
        {
            res = one
        }
        for i in stride(from: (n % 2) + 2,through: n,by: 2)
        {
            var t:[String] = [String]()
            for a in res
            {
                if i != n
                {
                    t.append("0" + a + "0")
                }
                t.append("1" + a + "1")
                t.append("6" + a + "9")
                t.append("8" + a + "8")
                t.append("9" + a + "6")
            }
            res = t
        }
        return res
    }
}

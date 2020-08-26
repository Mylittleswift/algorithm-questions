/***
 246 LeetCode Java: Strobogrammatic Number – Easy

 Problem:
 A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).
 
 Write a function to determine if a number is strobogrammatic. The number is represented as a string.
 
 For example, the numbers “69”, “88”, and “818” are all strobogrammatic.
 ***/



class Solution246x1 {
    func isStrobogrammatic(_ num:String) -> Bool {
        var m:[Character:Character] = ["0":"0","1":"1","8":"8","6":"9","9":"6"]
        let len = num.count
        for i in 0...len/2
        {
            if m[num[i]] != num[len - i - 1]
            {
                return false
            }
        }
        return true
    }
}

//extension String {
//    //subscript函数可以检索数组中的值
//    //直接按照索引方式截取指定索引的字符
//    subscript (_ i: Int) -> Character {
//        //读取字符
//        get {return self[index(startIndex, offsetBy: i)]}
//    }
//}

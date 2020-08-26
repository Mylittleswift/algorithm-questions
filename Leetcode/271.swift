/***
 271. Encode and Decode Strings
 Medium
 
 Problem:
 Design an algorithm to encode a list of strings to a string. The encoded string is then sent over the network and is decoded back to the original list of strings.
 
 Machine 1 (sender) has the function:
 
 string encode(vector strs) {
 // ... your code
 return encoded_string;
 }
 Machine 2 (receiver) has the function:
 vector decode(string s) {
 //... your code
 return strs;
 }
 So Machine 1 does:
 
 string encoded_string = encode(strs);
 and Machine 2 does:
 
 vector strs2 = decode(encoded_string);
 strs2 in Machine 2 should be the same as strs in Machine 1.
 
 Implement the encode and decode methods.
 
 Note:
 The string may contain any possible characters out of 256 valid ascii characters. Your algorithm should be generalized enough to work on any possible characters.
 Do not use class member/global/static variables to store states. Your encode and decode algorithms should be stateless.
 Do not rely on any library method such as eval or serialize methods. You should implement your own encode/decode algorithm.
 ***/



class Codec
{
    func encode(_ strs:inout [String]) -> String
    {
        var res:String = String()
        for a in strs
        {
            res += (String(a.count) + "/" + a)
        }
        return res
    }
    
    func decode(_ s:String) -> [String]
    {
        var s = s
        var res:[String] = [String]()
        while(!s.isEmpty)
        {
            var found:Int = s.find("/")
            var len:Int = Int(s.subString(0, found)) ?? 0
            s = s.subString(found + 1)
            res.append(s.subString(0, len))
            s = s.subString(len)
        }
        return res
    }
}

extension String {
    
    func find(_ char:Character) -> Int
    {
        var arr:[Character] = Array(self)
        for i in 0..<arr.count
        {
            if arr[i] == char
            {
                return i
            }
        }
        return -1
    }
    
    // 截取字符串：从index到结束处
    // - Parameter index: 开始索引
    // - Returns: 子字符串
    func subString(_ index: Int) -> String {
        let theIndex = self.index(self.endIndex, offsetBy: index - self.count)
        return String(self[theIndex..<endIndex])
    }
    
    // 截取字符串：指定索引和字符数
    // - begin: 开始截取处索引
    // - count: 截取的字符数量
//    func subString(_ begin:Int,_ count:Int) -> String {
//        let start = self.index(self.startIndex, offsetBy: max(0, begin))
//        let end = self.index(self.startIndex, offsetBy:  min(self.count, begin + count))
//        return String(self[start..<end])
//    }
}

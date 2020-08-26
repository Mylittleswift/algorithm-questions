/***
 158.Read N Characters Given Read4 II — Call multiple times
 Hard
 
 The return value is the actual number of characters read. For example, it returns 3 if there is only 3 characters left in the file.
 By using the read4 API, implement the function int read(char *buf, int n) that reads n characters from the file.
 
 Example 1:
 Given buf = "abc"
 read("abc", 1) // returns "a"
 read("abc", 2); // returns "bc"
 read("abc", 1); // returns ""
 
 Example 2:
 Given buf = "abc"
 read("abc", 4) // returns "abc"
 read("abc", 1); // returns ""
 
 Note:
 The read function may be called multiple times.
 ***/



class Solution158 {
    var readPos:Int = 0
    var writePos:Int = 0
    var buff:[Character] = [Character](repeating:" ",count:4)
    func read(_ buf:[Character],_ n:Int) -> Int {
        var i:Int = 0
        while (i < n && (readPos < writePos || (readPos = 0) < (writePos = read4(buff))))
        {
            buf[i] = buff[readPos]
            i += 1
            readPos += 1
        }
        return i
    }
}

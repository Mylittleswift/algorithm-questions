/***
 157.Read N Characters Given Read4
 Easy
 
 The API: int read4(char *buf) reads 4 characters at a time from a file.
 The return value is the actual number of characters read. For example, it returns 3 if there is only 3 characters left in the file.
 By using the read4 API, implement the function int read(char *buf, int n) that reads n characters from the file.
 Example 1:
 Input: buf = “abc”, n = 4
 Output: “abc”
 Explanation: The actual number of characters read is 3, which is “abc”.
 Example 2:
 Input: buf = “abcde”, n = 5
 Output: “abcde”
 Note:
 The read function will only be called once for each test case.
 ***/



class Solution157 {
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

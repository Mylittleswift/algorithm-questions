/***
 118. Pascal's Triangle
 Easy
 
 1288
 
 103
 
 Add to List
 
 Share
 Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
 
 
 In Pascal's triangle, each number is the sum of the two numbers directly above it.
 
 Example:
 
 Input: 5
 Output:
 [
 [1],
 [1,1],
 [1,2,1],
 [1,3,3,1],
 [1,4,6,4,1]
 ]
 ***/



class Solution118x1 {
    func generate(_ numRows: Int) -> [[Int]] {
        var res:[[Int]] =  [[Int]]()
        if numRows <= 0 {return res}
        var arr:[Int] = [Int]()
        arr.append(1)
        res.append(arr)
        
        for i in 1..<numRows
        {
            var temp:[Int] = [Int]()
            temp.append(1)
            
            var count:Int = res[i - 1].count
            for j in 1..<count
            {
                temp.append(res[i-1][j]+res[i-1][j-1])
            }
            temp.append(1)
            res.append(temp)
        }
        return res
    }
}


class Solution118x2 {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else {
            return []
        }
        
        var temp = [[1]]
        for i in 1..<numRows {
            let last = temp[i - 1]
            var arr = [Int]()
            for j in 0...i {
                var n : Int
                if j == 0 {
                    n = 1
                }else if j == i {
                    n = last[j - 1]
                }else {
                    n = last[j] + last[j - 1]
                }
                arr.append(n)
            }
            temp.append(arr)
        }
        
        return temp
    }
}


class Solution118x3 {
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 0 { return [] }
        else if numRows == 1 { return [[1]] }
        else if numRows == 2 { return [[1], [1,1]] }
        
        var memo = [[1], [1,1]]
        
        for i in 1..<numRows-1 {
            let prevArr = memo[i]
            var arr = Array(repeating: 0, count: prevArr.count+1)
            arr[0] = 1
            arr[arr.count-1] = 1
            
            for j in 1..<arr.count-1 {
                arr[j] = prevArr[j-1]+prevArr[j]
            }
            
            memo.append(arr)
        }
        
        return memo
    }
}


class Solution118x4 {
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 0 {
            return []
        }
        var result = [[1]]
        for i in 1...numRows {
            var numRow = [Int]()
            var lastNumRow = result[i - 1]
            for j in 0..<i {
                if j == 0 || j == i - 1 {
                    numRow.append(1)
                } else {
                    numRow.append(lastNumRow[j - 1] + lastNumRow[j])
                }
            }
            result.append(numRow)
        }
        result.remove(at: 0)
        return result
    }
}

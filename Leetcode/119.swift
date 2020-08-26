/***
 119. Pascal's Triangle II
 Easy
 
 744
 
 193
 
 Add to List
 
 Share
 Given a non-negative index k where k ≤ 33, return the kth index row of the Pascal's triangle.
 
 Note that the row index starts from 0.
 
 
 In Pascal's triangle, each number is the sum of the two numbers directly above it.
 
 Example:
 
 Input: 3
 Output: [1,3,3,1]
 Follow up:
 
 Could you optimize your algorithm to use only O(k) extra space?
 ***/


class Solution119x1 {
    func getRow(_ rowIndex: Int) -> [Int] {
        //滚动数组
        var arr:Array = Array(repeating: 1, count: (rowIndex+1))
        for i in 0..<rowIndex
        {
            // 第一个元素 不需要计算 所以j从 1 开始
            // i+1 代表最后一个元素:  < (i+1) 表示最后一个元素不用计算
            for j in (1 ..< (i+1)).reversed()
            {
                // 从后往前计算, 防止覆盖
                arr[j] =  arr[j] + arr[j - 1]
            }
        }
        return arr
    }
}


class Solution119x2 {
    func getRow(_ rowIndex: Int) -> [Int] {
        var memo: [[Int]] = [[1], [1, 1]]
        if rowIndex <= 1 { return memo[rowIndex] }
        return calculateRows(memo, rowIndex)
    }
    
    func calculateRows (_ memo: [[Int]], _ rowIndex: Int) -> [Int] {
        if memo.count-1 == rowIndex { return memo[rowIndex] }
        var dp = memo
        var prevArr = dp[dp.count-1]
        var arr = Array(repeating: 0, count: prevArr.count+1)
        arr[0] = 1
        arr[arr.count-1] = 1
        
        for i in 1..<arr.count-1 {
            arr[i] = prevArr[i-1]+prevArr[i]
        }
        
        dp.append(arr)
        return calculateRows(dp, rowIndex)
    }
}


class Solution119x3 {
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 {
            return [1]
        }
        var result =  [Int](repeatElement(0, count: rowIndex + 1))
        result[0] = 1
        for i in 1...rowIndex {
            var j = i
            while j >= 1 {
                result[j] += result[j - 1]
                j -= 1
            }
        }
        return result
    }
}



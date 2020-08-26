/***
 188. Best Time to Buy and Sell Stock IV
 Hard

 Say you have an array for which the i-th element is the price of a given stock on day i.
 
 Design an algorithm to find the maximum profit. You may complete at most k transactions.
 
 Note:
 You may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
 
 Example 1:
 
 Input: [2,4,1], k = 2
 Output: 2
 Explanation: Buy on day 1 (price = 2) and sell on day 2 (price = 4), profit = 4-2 = 2.
 Example 2:
 
 Input: [3,2,6,5,0,3], k = 2
 Output: 7
 Explanation: Buy on day 2 (price = 2) and sell on day 3 (price = 6), profit = 6-2 = 4.
 Then buy on day 5 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
 ***/



class Solution188x1 {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        guard prices.count > 1, k > 0 else { return 0 }
        let n = prices.count
        
        if k >= (n / 2) {
            var res = 0
            for i in 1..<n {
                if (prices[i] > prices[i-1]) {
                    res += prices[i] - prices[i-1]
                }
                
            }
            return res
        }
        var mp = [[Int]](repeating: [Int](repeating: 0, count: k + 1), count: prices.count)
        for i in 1...k {
            var localMax = -prices[0]
            for j in 1..<n {
                mp[j][i] = max(mp[j-1][i], prices[j]+localMax)
                localMax = max(localMax, mp[j-1][i-1]-prices[j])
            }
        }
        return mp[prices.count-1][k]
    }
}


class Solution188x2 {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        
        var n = prices.count
        if n < 2 || k == 0 { return 0 }
        if k >= n { return maxProfit(prices)}
        var l = Array(repeating: 0, count: k+1)
        var g = Array(repeating: 0, count: k+1)
        for i in 0..<n-1 {
            var diff = prices[i+1] - prices[i]
            for j in stride(from: k, through: 1, by: -1){
                l[j] = max(g[j-1] + max(diff, 0), l[j] + diff)
                g[j] = max(g[j], l[j])
            }
        }
        
        
        return g[k];
        
    }
    func maxProfit(_ prices: [Int]) -> Int {
        var res = 0
        for i in 1..<prices.count {
            res += max(0, prices[i] - prices[i-1])
        }
        return res
    }
}



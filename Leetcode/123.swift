/***
 123. Best Time to Buy and Sell Stock III
 Hard
 
 1895
 
 70
 
 Add to List
 
 Share
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 Design an algorithm to find the maximum profit. You may complete at most two transactions.
 
 Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).
 
 Example 1:
 
 Input: [3,3,5,0,0,3,1,4]
 Output: 6
 Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
 Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.
 Example 2:
 
 Input: [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
 Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
 engaging multiple transactions at the same time. You must sell before buying again.
 Example 3:
 
 Input: [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
 ***/



class Solution123x1 {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxPriceFromLeft = Array(repeating:0,count:prices.count)
        var minPrice = Int.max
        var delta = 0
        
        for (day,price) in prices.enumerated() {
            delta = max(price-minPrice,delta)
            maxPriceFromLeft[day] = delta
            minPrice = min(minPrice,price)
        }
        
        var ans = 0
        var maxPrice = 0
        delta = 0
        for index in stride(from:prices.count - 1,through:0,by:-1) {
            delta = max(maxPrice - prices[index],delta)
            ans = max(ans,maxPriceFromLeft[index] + delta)
            maxPrice = max(maxPrice,prices[index])
        }
        
        return ans
    }
}


class Solution123x2 {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty {return 0}
        let nt = 2
        var profits = Array(repeating: [0, -prices[0]], count: nt + 1)
        
        for i in 0..<prices.count {
            profits[0][1] = max(profits[0][1], profits[0][0] - prices[i])
            for t in 1...nt {
                let temp = profits[t][0]
                profits[t][0] = max(profits[t][0], profits[t - 1][1] + prices[i])
                profits[t][1] = max(profits[t][1], profits[t][0] - prices[i])
            }
        }
        print(profits)
        return profits.max{$0[0] < $1[0]}![0]
    }
}


class Solution123x3 {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else {
            return 0
        }
        
        var maxProfit = 0
        var finalMaxProfit = 0
        var maxProfitLeft = [Int]()
        var low = prices.first!
        var high = prices.last!
        
        for price in prices {
            maxProfit = max(price - low, maxProfit)
            low = min(price, low)
            maxProfitLeft.append(maxProfit)
        }
        
        maxProfit = 0
        
        for i in (0..<prices.count).reversed() {
            let price = prices[i]
            maxProfit = max(high - price, maxProfit)
            high = max(price, high)
            finalMaxProfit = max(finalMaxProfit, maxProfit + maxProfitLeft[i])
        }
        
        return finalMaxProfit
    }
}


class Solution123x4 {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        
        var curr = Array(repeating: 0, count: 3)
        var res = Array(repeating: 0, count: 3)
        for i in 0..<prices.count - 1 {
            for j in (1...2).reversed() {
                var diff = prices[i + 1] - prices[i]
                curr[j] = max(res[j - 1] + (diff > 0 ? diff : 0), curr[j] + diff)
                res[j] = max(res[j], curr[j])
            }
        }
        return res[2]
    }
}

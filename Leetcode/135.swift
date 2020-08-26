/***
 135. Candy
 Hard

 There are N children standing in a line. Each child is assigned a rating value.
 
 You are giving candies to these children subjected to the following requirements:
 
 Each child must have at least one candy.
 Children with a higher rating get more candies than their neighbors.
 What is the minimum candies you must give?
 
 Example 1:
 
 Input: [1,0,2]
 Output: 5
 Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
 Example 2:
 
 Input: [1,2,2]
 Output: 4
 Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively.
 The third child gets 1 candy because it satisfies the above two conditions.
 ***/



public class Solution135x1 {
    func candy(_ ratings: [Int]) -> Int {
        let size = ratings.count
        
        if size == 0 {
            return -1
        }
        if size == 1 {
            return 1
        }
        
        var candys = Array(repeating: 1, count: size)
        
        for i in 1..<size {
            if ratings[i] > ratings[i - 1] {
                candys[i] = candys[i - 1] + 1
            }
        }
        for i in 1..<size {
            let j = size - i
            if ratings[j - 1] > ratings[j], candys[j - 1] <= candys[j]{
                candys[j - 1] = candys[j] + 1
            }
        }
        
        var sum = 0
        for i in 0..<size {
            sum += candys[i]
        }
        return sum
    }
}


class Solution135x2 {
    func candy(_ ratings: [Int]) -> Int {
        var result = 1
        var more = 0 // 连升次数
        var less = 0 // 连降次数
        var mark = 0
        
        for index in 1..<ratings.count {
            let dis = ratings[index] - ratings[index - 1]
            if dis > 0 { // 升
                more += 1
                less = 0
                
                result += more + 1
            } else if dis == 0 {
                more = 0
                less = 0
                mark = 0
                result += 1
            } else {
                if more > 0 {
                    mark = more
                    more = 0
                }
                less += 1
                result += less + (less > mark ? 1 : 0)
            }
        }
        return result
    }
}


class Solution135x3 {
    func candy(_ ratings: [Int]) -> Int {
        var candies = Array(repeating:1,count:ratings.count)
        var numCandies = 0
        
        //Go forward
        for i in 1..<ratings.count {
            if(ratings[i]>ratings[i-1]) {
                candies[i] = candies[i-1]+1
            }
        }
        
        for i in stride(from:ratings.count-2,through:0,by:-1) {
            if(ratings[i]>ratings[i+1] && (candies[i] <= candies[i+1])) {
                candies[i] = candies[i+1]+1
            }
        }
        
        print(candies)
        numCandies = candies.reduce(0,+)
        
        return numCandies
    }
}

class Solution135x4 {
    func candy(_ ratings: [Int]) -> Int {
        guard ratings.count > 0 else { return 0 }
        
        // o(n), space, nlog(n) time
        let orderedKids = ratings.enumerated().map { ($1, $0) }.sorted { $0.0 < $1.0 }
        
        // (n), space, n, time
        var candies = Array(repeating: 1, count: ratings.count)
        
        // n time
        orderedKids.forEach { (rating, index) in
            var currentCandy = candies[index]
            if index > 0 && rating < ratings[index - 1] && currentCandy >= candies[index - 1] {
                candies[index - 1] = currentCandy + 1
            }
            if index < candies.count - 1 && rating < ratings[index + 1] && currentCandy >= candies[index + 1] {
                candies[index + 1] = currentCandy + 1
            }
        }
        // n time, o (1) space
        return candies.reduce(into: 0) { $0 += $1 }
    }
}

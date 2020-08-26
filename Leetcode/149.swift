/***
 149. Max Points on a Line
 Hard

 Given n points on a 2D plane, find the maximum number of points that lie on the same straight line.
 
 Example 1:
 
 Input: [[1,1],[2,2],[3,3]]
 Output: 3
 Explanation:
 ^
 |
 |        o
 |     o
 |  o
 +------------->
 0  1  2  3  4
 Example 2:
 
 Input: [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
 Output: 4
 Explanation:
 ^
 |
 |  o
 |     o        o
 |        o
 |  o        o
 +------------------->
 0  1  2  3  4  5  6
 NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
 ***/




class Solution149x1 {
    func maxPoints(_ points: [Point]) -> Int {
        var result: Int = 0
        for i in 0 ..< points.count {
            var map: [String: Int] = [:]
            var same: Int = 0
            var maxP: Int = 0
            for j in i + 1 ..< points.count {
                var x = points[j].x - points[i].x
                var y = points[j].y - points[i].y
                if x == 0 && y == 0 {
                    // same point
                    same += 1
                    continue
                }
                let gcd = findGCD(x, y)
                if gcd != 0 {
                    x /= gcd
                    y /= gcd
                }
                let d = "\(x)@\(y))"
                map[d, default: 0] += 1
                maxP = max(maxP, map[d]!)
            }
            result = max(result, maxP + same + 1) // 1 for itself
        }
        return result
    }
    
    func findGCD(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        return findGCD(b, a % b)
    }
}



class Solution149x2 {
    func maxPoints(_ points: [Point]) -> Int {
        guard points.count > 2 else {
            return points.count
        }
        var result = 0
        for i in 0..<points.count {
            var overlap = 0
            var infinite = 0
            var zero = 0
            var tempMax = 0
            var map = [Int: [Int: Int]]()
            for j in i + 1..<points.count {
                var xDiff = points[j].x - points[i].x
                var yDiff = points[j].y - points[i].y
                if xDiff == 0 && yDiff == 0 {
                    overlap += 1
                } else if xDiff == 0 {
                    infinite += 1
                } else if yDiff == 0 {
                    zero += 1
                } else {
                    let gcd = getGcd(xDiff, yDiff)
                    xDiff /= gcd
                    yDiff /= gcd
                    if map[xDiff] != nil {
                        map[xDiff]![yDiff] = (map[xDiff]![yDiff] ?? 0) + 1
                    } else {
                        map[xDiff] = [yDiff: 1]
                    }
                    tempMax = max(tempMax, map[xDiff]![yDiff]!)
                }
            }
            result = max(result, max(max(infinite, zero), tempMax) + overlap)
        }
        return result + 1
    }
    
    private func getGcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
    }
}


class Solution149x3 {
    func maxPoints(_ points: [Point]) -> Int {
        guard points.count > 2 else {
            return points.count
        }
        var maxPointsCount = 2
        for i in 0 ..< points.count {
            var dict = [P: Int]()
            var maxCount = 1
            var vertical = 1
            var duplicateI = 0
            for j in 0 ..< points.count {
                if i != j {
                    if points[i].x == points[j].x, points[i].y == points[j].y {
                        duplicateI += 1
                    } else if points[j].x - points[i].x == 0 {
                        vertical += 1
                    } else {
                        let dy = points[j].y - points[i].y
                        let dx = points[j].x - points[i].x
                        let gcd = getGCD(dx, dy)
                        if let count = dict[P(dy / gcd, dx / gcd)] {
                            dict[P(dy / gcd, dx / gcd)] = count + 1
                            if count + 1 > maxCount {
                                maxCount = count + 1
                            }
                        } else {
                            dict[P(dy / gcd, dx / gcd)] = 2
                        }
                    }
                }
            }
            maxPointsCount = max(maxPointsCount, maxCount + duplicateI, vertical + duplicateI)
        }
        return maxPointsCount
    }
    
    func getGCD(_ dx: Int, _ dy: Int) -> Int {
        var x = dx
        var y = dy
        while y != 0 {
            let temp = y
            y = x % y
            x = temp
        }
        return x
    }
    class P: Hashable {
        let x: Int
        let y: Int
        var hashValue: Int {
            return (x + y).hashValue
        }
        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
        static func == (lhs: P, rhs: P) -> Bool {
            return lhs.x == rhs.x && lhs.y == rhs.y
        }
    }
}

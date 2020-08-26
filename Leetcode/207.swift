/***
 207. Course Schedule
 Medium

 There are a total of numCourses courses you have to take, labeled from 0 to numCourses-1.
 
 Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]
 
 Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses?
 
 
 
 Example 1:
 
 Input: numCourses = 2, prerequisites = [[1,0]]
 Output: true
 Explanation: There are a total of 2 courses to take.
 To take course 1 you should have finished course 0. So it is possible.
 Example 2:
 
 Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
 Output: false
 Explanation: There are a total of 2 courses to take.
 To take course 1 you should have finished course 0, and to take course 0 you should
 also have finished course 1. So it is impossible.
 
 
 Constraints:
 
 The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
 You may assume that there are no duplicate edges in the input prerequisites.
 1 <= numCourses <= 10^5
 ***/




class Solution207x1 {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        
        var graph = Array(repeating: Array(repeating: 0, count: 0), count: numCourses)
        var courses = Array(repeating: 0, count: numCourses)
        for a in prerequisites {
            graph[a[1]].append(a[0])
            courses[a[0]] += 1
        }
        var q = [Int]()
        for (i, num) in courses.enumerated() {
            if num == 0 { q.append(i) }
        }
        while !q.isEmpty {
            var t = q.removeLast()
            for a in graph[t]{
                courses[a] -= 1
                if courses[a] == 0 { q.append(a)}
            }
        }
        
        for a in courses {
            //   if a != 0 { return false }
        }
        return courses.filter{ $0 != 0 }.count == 0
    }
}


class Solution207x2 {
    func canFinish(_ total: Int, _ nums: [[Int]]) -> Bool {
        var dict: [Int: [Int]] = [:]
        var prev: [Int] = Array(repeating: 0, count: total)
        for num in nums {
            prev[num[0]] += 1
            dict[num[1], default: []].append(num[0])
        }
        var count = 0
        var queue: [Int] = []
        for (index, num) in prev.enumerated() {
            if num == 0 {
                queue.append(index)
            }
        }
        while queue.isEmpty == false {
            let num = queue.removeFirst()
            count += 1
            if let courses = dict[num] {
                for course in courses {
                    prev[course] -= 1
                    if prev[course] == 0 {
                        queue.append(course)
                    }
                }
            }
        }
        return count == total
    }
}


class Solution207x3 {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = [[Int]](repeating: [Int](), count: numCourses)
        var indegrees = [Int](repeating: 0, count: numCourses)
        for prerequisite in prerequisites {
            graph[prerequisite.last!].append(prerequisite.first!)
            indegrees[prerequisite.first!] += 1
        }
        var queue = [Int]()
        for i in 0..<numCourses {
            if indegrees[i] == 0 {
                queue.append(i)
            }
        }
        var sortedNodes = [Int]()
        while !queue.isEmpty {
            let node = queue.removeFirst()
            sortedNodes.append(node)
            let followingNodes = graph[node]
            for followingNode in followingNodes {
                indegrees[followingNode] -= 1
                if indegrees[followingNode] == 0 {
                    queue.append(followingNode)
                }
            }
        }
        return sortedNodes.count == numCourses
    }
}

/***
 210. Course Schedule II
 Medium

 There are a total of n courses you have to take, labeled from 0 to n-1.
 
 Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]
 
 Given the total number of courses and a list of prerequisite pairs, return the ordering of courses you should take to finish all courses.
 
 There may be multiple correct orders, you just need to return one of them. If it is impossible to finish all courses, return an empty array.
 
 Example 1:
 
 Input: 2, [[1,0]]
 Output: [0,1]
 Explanation: There are a total of 2 courses to take. To take course 1 you should have finished
 course 0. So the correct course order is [0,1] .
 Example 2:
 
 Input: 4, [[1,0],[2,0],[3,1],[3,2]]
 Output: [0,1,2,3] or [0,2,1,3]
 Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both
 courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0.
 So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3] .
 Note:
 
 The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
 You may assume that there are no duplicate edges in the input prerequisites.
 ***/


class Solution210x1 {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        
        var graph = [[Int]](repeating:[Int](), count: numCourses)
        var coursesIn = Array(repeating: 0,  count: numCourses)
        var res = [Int]()
        for a in prerequisites {
            graph[a[1]].append(a[0])
            coursesIn[a[0]] += 1
        }
        var q = [Int]()
        for i in coursesIn.indices {
            if coursesIn[i] == 0 { q.append(i) }
        }
        while !q.isEmpty {
            var t = q.removeFirst()
            res.append(t)
            for a in graph[t] {
                coursesIn[a] -= 1
                
                if coursesIn[a] == 0 { q.append(a) }
                
            }
        }
        if res.count != numCourses { res.removeAll() }
        return res
    }
}


class Solution210x2 {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        if numCourses == 0 {
            return []
        } else if numCourses == 1 {
            return [0]
        }
        
        var inDegree = Array(repeating: 0, count: numCourses)
        var graph = [Int: [Int]]()
        for prerequisite in prerequisites {
            inDegree[prerequisite[0]] += 1
            graph[prerequisite[1], default: [Int]()].append(prerequisite[0])
        }
        var queue = [Int]()
        for course in 0 ..< numCourses where inDegree[course] == 0{
            queue.append(course)
        }
        var result = [Int]()
        while !queue.isEmpty {
            let course = queue.removeFirst()
            result.append(course)
            if let courses = graph[course] {
                for course in courses {
                    inDegree[course] -= 1
                    if inDegree[course] == 0 {
                        queue.append(course)
                    }
                }
            }
        }
        return result.count == numCourses ? result : []
    }
}



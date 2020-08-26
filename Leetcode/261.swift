/***
 261. Graph Valid Tree
 Medium
 
 Problem:
 Given n nodes labeled from 0 to n - 1 and a list of undirected edges (each edge is a pair of nodes), write a function to check whether these edges make up a valid tree.
 For example:
 Given n = 5 and edges = [[0, 1], [0, 2], [0, 3], [1, 4]], return true.
 Given n = 5 and edges = [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]], return false.
 Show Hint Note: you can assume that no duplicate edges will appear in edges. Since all edges are undirected, [0, 1] is the same as [1, 0] and thus will not appear together in edges.
 ***/



class Solution261 {
    func validTree(_ n:Int,_ edges:[[Int]]) -> Bool{
        var g:[Set<Int>] = [Set<Int>](repeating:Set<Int>(),count:n)
        var s:Set<Int> = [0]
        var q:[Int] = [0]
        for a in edges
        {
            g[a[0]].insert(a[1]);
            g[a[1]].insert(a[0]);
        }
        while(!q.isEmpty)
        {
            var t:Int = q.first!
            q.removeFirst()
            for a in g[t]
            {
                if s.contains(a)
                {
                    return false
                }
                s.insert(a)
                q.append(a)
                g[a].remove(t)
            }
        }
        return s.count == n
    }
}

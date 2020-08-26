/***
 223. Rectangle Area
 Medium

 Find the total area covered by two rectilinear rectangles in a 2D plane.
 
 Each rectangle is defined by its bottom left corner and top right corner as shown in the figure.
 
 Rectangle Area
 
 Example:
 
 Input: A = -3, B = 0, C = 3, D = 4, E = 0, F = -1, G = 9, H = 2
 Output: 45
 Note:
 
 Assume that the total area is never beyond the maximum possible value of int.
 ***/



class Solution223x1 {
    func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
        
        var sum = (C-A)*(D-B)+(G-E)*(H-F)
        if E>=C || H<=B || F>=D || G<=A { return sum }
        return sum - (min(G, C) - max(A, E)) * (min(D, H) - max(B, F))
    }
}


class Solution223x2 {
    func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
        
        let area1 = (C - A) * (D - B)
        let area2 = (G - E) * (H - F)
        let sum = area1 + area2
        
        if A >= G || C <= E || B >= H || D <= F {
            return sum
        } else {
            let x = [A,C,E,G].sorted(by: < )
            let w = x[2] - x[1]
            let y = [B,D,F,H].sorted(by: < )
            let h = y[2] - y[1]
            
            return sum - (w*h)
        }
        
    }
}


class Solution223x3 {
    func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
        if A > C || B > D || E > G || F > H {
            return 0
        }
        let area = (C - A) * (D - B) + (G - E) * (H - F)
        if max(A, E) > min(C, G) || max(B, F) > min(D, H){
            return area
        }
        return area - (min(C, G) - max(A, E)) * (min(D, H) - max(B, F))
    }
}

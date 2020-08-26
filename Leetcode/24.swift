/***
 24. Swap Nodes in Pairs
 Medium

 Given a linked list, swap every two adjacent nodes and return its head.
 
 You may not modify the values in the list's nodes, only nodes itself may be changed.
 
 
 
 Example:
 
 Given 1->2->3->4, you should return the list as 2->1->4->3.
 ***/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution24x1 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var current = head
        let result = head?.next ?? head
        while let next = current?.next {
            let nextNext = next.next
            next.next = current
            current?.next = nextNext?.next ?? nextNext
            current = nextNext
        }
        return result
    }
}


class Solution24x2 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var current = head
        var next = current?.next
        while next != nil {
            (current!.val, next!.val) = (next!.val, current!.val)
            current = current?.next?.next
            next = current?.next
        }
        return head
    }
}


class Solution24x3 {
    func swapNodes(pre: ListNode?, first: ListNode) {
        let temp = first.next?.next
        if pre != nil {
            pre?.next = first.next
        }
        if first.next?.next != nil {
            first.next?.next = first
            first.next = temp
        } else {
            first.next?.next = first
            first.next = nil
        }
    }
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var result = head
        if let root = head {
            if root.next != nil {
                result = root.next
            }
            var current: ListNode? = head
            while(current?.next != nil) {
                swapNodes(pre: pre, first: current!)
                pre = current
                current = current?.next
            }
        }
        return result
    }
}



class Solution24x4 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        var left: ListNode? = head
        var right = head.next
        let root = head.next
        while left != nil {
            let temp = right?.next
            right?.next = left
            left?.next = temp?.next ?? temp
            
            left = temp
            right = temp?.next
        }
        
        return root ?? head
    }
}

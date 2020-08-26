/***
 25. Reverse Nodes in k-Group
 Hard

 Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
 
 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
 
 Example:
 
 Given this linked list: 1->2->3->4->5
 
 For k = 2, you should return: 2->1->4->3->5
 
 For k = 3, you should return: 3->2->1->4->5
 
 Note:
 
 Only constant extra memory is allowed.
 You may not alter the values in the list's nodes, only nodes itself may be changed.
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
class Solution25x1 {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummyHead = ListNode(0)
        dummyHead.next = head
        var previous: ListNode? = dummyHead
        var first = head
        var kthNode: ListNode? = first
        for _ in 1..<k {
            kthNode = kthNode?.next
        }
        
        while kthNode != nil {
            let nextNode = kthNode?.next
            kthNode?.next = nil
            previous?.next = reverseList(head: first)
            first?.next = nextNode
            previous = first
            first = previous?.next
            kthNode = first
            for _ in 1..<k {
                kthNode = kthNode?.next
            }
        }
        return dummyHead.next
    }
    
    func reverseList(head: ListNode?) -> ListNode? {
        var oldList = head
        var newList: ListNode? = nil
        
        while let node = oldList {
            let nextNode = node.next
            node.next = newList
            newList = node
            
            oldList = nextNode
        }
        return newList
    }
}



class Solution25x2 {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head?.next == nil {
            return head
        }
        let dummy: ListNode? = ListNode(0)
        dummy!.next = head
        var pre = dummy, start = dummy, end = dummy
        while end != nil {
            end = pre
            for _ in 0..<k {
                end = end?.next
                if end == nil {
                    return dummy?.next
                }
            }
            for _ in 1..<k {
                start = pre!.next
                pre!.next = start!.next
                start!.next = end!.next
                end!.next = start
            }
            for _ in 0..<k {
                pre = pre!.next
            }
        }
        return dummy!.next
    }
}



class Solution25x3 {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummyHead = ListNode(0)
        dummyHead.next = head
        var previous = dummyHead
        var start = dummyHead.next
        var end = start
        while end != nil {
            for _ in 0..<k - 1 {
                end = end == nil ? nil : end!.next
            }
            if end != nil {
                let next = end!.next
                var newStart = start
                while start!.next !== next {
                    let nextNext = start!.next!.next
                    previous.next = start!.next
                    start!.next!.next = newStart
                    newStart = previous.next
                    start!.next = nextNext
                }
                previous = start!
                start = next
                end = start
            }
        }
        return dummyHead.next
    }
}



class Solution25x5 {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var head:ListNode? = head
        var current_node:ListNode?  = head
        var count:Int = 0
        while(current_node != nil && count != k) {
            current_node = current_node!.next
            count += 1
        }
        if count == k {
            // 递归的解决子问题
            current_node = reverseKGroup(current_node, k)
            while (count-- > 0) {
                let temp:ListNode? = head!.next
                head!.next = current_node
                current_node = head
                head = temp
            }
            //最终，该段的所有节点将会截空，head应指向current_node
            head = current_node
        }
        return head
    }
}

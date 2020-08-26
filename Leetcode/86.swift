/***
 86. Partition List
 Medium
 
 1143
 
 283
 
 Add to List
 
 Share
 Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.
 
 You should preserve the original relative order of the nodes in each of the two partitions.
 
 Example:
 
 Input: head = 1->4->3->2->5->2, x = 3
 Output: 1->2->2->4->3->5
 ***/



class Solution86x1 {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var head = head
        
        var leftHead = ListNode(0)
        let leftDummy = leftHead
        
        var rightHead = ListNode(0)
        var rightDummy = rightHead
        
        while head != nil {
            if head!.val < x {
                leftHead.next = head
                leftHead = leftHead.next ?? ListNode(0)
            }else {
                rightHead.next = head
                rightHead = rightHead.next ?? ListNode(0)
            }
            head = head!.next
        }
        
        leftHead.next = rightDummy.next
        rightHead.next = nil
        return leftDummy.next
    }
}



class Solution86x2 {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let prevDummy = ListNode(0), postDummy = ListNode(0)
        var prev = prevDummy, post = postDummy
        
        var node = head
        
        while node != nil {
            let next = node!.next
            node!.next = nil
            
            if node!.val < x {
                prev.next = node
                prev = prev.next!
            } else {
                post.next = node
                post = post.next!
            }
            node = next
        }
        
        prev.next = postDummy.next
        
        return prevDummy.next
    }
}



class Solution86x3 {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let dummyHead1 = ListNode(0)
        let dummyHead2 = ListNode(0)
        var p1 = dummyHead1
        var p2 = dummyHead2
        var p = head
        while p != nil {
            if p!.val < x {
                p1.next = p
                p1 = p!
            } else {
                p2.next = p
                p2 = p!
            }
            p = p!.next
        }
        p1.next = dummyHead2.next
        p2.next = nil
        return dummyHead1.next
    }
}

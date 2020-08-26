/***
 203. Remove Linked List Elements
 Easy

 Remove all elements from a linked list of integers that have value val.
 
 Example:
 
 Input:  1->2->6->3->4->5->6, val = 6
 Output: 1->2->3->4->5
 ***/



class Solution203x1 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard head != nil else { return nil }
        
        var head = head
        while head != nil, head!.val == val {
            head = head?.next
        }
        
        var prev = head
        var current = head?.next
        
        while let curr = current {
            if curr.val == val {
                prev?.next = curr.next
                current = curr.next
                continue
            }
            prev = curr
            current = curr.next
        }
        
        return head
    }
}



class Solution203x2 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard let head = head else { return nil }
        head.next = removeElements(head.next, val)
        return head.val == val ? head.next : head
    }
}



class Solution203x3 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        var dummy = ListNode(-1)
        dummy.next = head
        var cur = dummy
        while cur.next != nil {
            if cur.next!.val == val {
                cur.next = cur.next!.next
            }
            else{
                cur = cur.next!
            }
        }
        return dummy.next
    }
}



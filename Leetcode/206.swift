/***
 206. Reverse Linked List
 Easy

 Reverse a singly linked list.
 
 Example:
 
 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 Follow up:
 
 A linked list can be reversed either iteratively or recursively. Could you implement both?
 ***/




class Solution206x1 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil
        {
            return head
        }
        var h = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return h
    }
}



class Solution206x2 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var pre : ListNode?
        var next : ListNode?
        var cur : ListNode? = head
        
        while (cur != nil) {
            next = cur?.next;
            cur?.next = pre;
            pre = cur;
            cur = next;
        }
        
        return pre;
    }
}



class Solution206x3 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        
        if head?.next == nil {
            return head
        }
        
        guard let r = reverseList(head?.next) else { return nil }
        if r.next == nil {
            r.next = head
        } else {
            head!.next!.next = head
        }
        head!.next = nil
        return r
    }
}

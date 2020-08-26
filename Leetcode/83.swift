/***
 83. Remove Duplicates from Sorted List
 Easy

 Given a sorted linked list, delete all duplicates such that each element appear only once.
 
 Example 1:
 
 Input: 1->1->2
 Output: 1->2
 Example 2:
 
 Input: 1->1->2->3->3
 Output: 1->2->3
 ***/




class Solution83x1 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var temp = head
        while temp != nil {
            if temp?.next?.val == temp?.val {
                temp?.next = temp?.next?.next
            } else {
                temp = temp?.next
            }
        }
        
        return head
    }
}



class Solution83x2 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        var node: ListNode? = head
        var next: ListNode? = nil
        
        while node != nil {
            
            next = node!.next
            while next != nil && next!.val == node!.val {
                next = next!.next
            }
            
            node!.next = next
            node = next
        }
        
        return head
    }
}


class Solution83x3 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var r = head
        while r?.next != nil {
            if r?.val == r?.next?.val {
                r?.next = r?.next?.next
            } else {
                r = r?.next
            }
        }
        return head
    }
}



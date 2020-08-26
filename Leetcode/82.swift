/***
 82. Remove Duplicates from Sorted List II
 Medium

 Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.
 
 Return the linked list sorted as well.
 
 Example 1:
 
 Input: 1->2->3->3->4->4->5
 Output: 1->2->5
 Example 2:
 
 Input: 1->1->1->2->3
 Output: 2->3
 ***/



class Solution82x1 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var node = head
        var result: ListNode? = nil
        var prevNode: ListNode? = nil
        while node != nil {
            var next = node!.next
            if next != nil && next!.val == node!.val {
                while next != nil && next!.val == node!.val {
                    next = next!.next
                }
                if prevNode != nil {
                    prevNode!.next = next
                } else {
                    if result == nil { result = prevNode }
                }
                node = next
            } else {
                prevNode = node
                if result == nil { result = prevNode }
                node = next
            }
        }
        return result
    }
}



class Solution82x2 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0)
        dummyHead.next = head
        var previous: ListNode? = dummyHead
        var current = previous
        
        while current != nil {
            while current?.next != nil && previous?.next?.val == current?.next?.val {
                current = current?.next
            }
            
            if previous?.next === current {
                previous = previous?.next
            } else {
                previous?.next = current?.next
            }
            current = current?.next
        }
        
        return dummyHead.next
    }
}



class Solution82x3 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let root = ListNode(-1)
        root.next = head
        var node: ListNode? = root
        while node?.next != nil {
            if node?.next?.val == node?.next?.next?.val {
                let val = node?.next?.val
                while node?.next != nil && node?.next?.val == val {
                    node?.next = node?.next?.next
                }
            } else {
                node = node?.next
            }
        }
        return root.next
    }
}



class Solution82x4 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        let dummy:ListNode? = ListNode(0)
        dummy?.next = head
        var pre = dummy
        while pre?.next != nil {
            var same = false
            var node = pre?.next
            while node?.next != nil && node!.val == node?.next!.val {
                node = node?.next
                same = true
            }
            if same {
                pre?.next = node?.next
            } else {
                pre = pre?.next
            }
        }
        return dummy?.next
    }
}

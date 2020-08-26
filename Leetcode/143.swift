/***
 143. Reorder List
 Medium
 
 1680
 
 109
 
 Add to List
 
 Share
 Given a singly linked list L: L0→L1→…→Ln-1→Ln,
 reorder it to: L0→Ln→L1→Ln-1→L2→Ln-2→…
 
 You may not modify the values in the list's nodes, only nodes itself may be changed.
 
 Example 1:
 
 Given 1->2->3->4, reorder it to 1->4->2->3.
 Example 2:
 
 Given 1->2->3->4->5, reorder it to 1->5->2->4->3.
 ***/




class Solution143X1 {
    func reorderList(_ head: ListNode?) {
        var arr = [ListNode]()
        var cur = head
        while cur != nil {
            arr.append(cur!)
            cur = cur!.next
        }
        var i = 0
        var j = arr.count - 1
        
        cur = nil
        while i <= j {
            if i == j {
                cur?.next = arr[j]
                cur = arr[j]
                break
            }
            
            cur?.next = arr[i]
            arr[i].next = arr[j]
            cur = arr[j]
            
            i += 1
            j -= 1
        }
        cur?.next = nil
    }
}



class Solution143X2 {
    func reorderList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var slow: ListNode? = head
        var fast: ListNode? = head
        while fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        let next = reverseList(slow?.next)
        slow?.next = nil
        slow = head
        fast = next
        var curr: ListNode? = nil
        while slow != nil {
            curr?.next = slow
            curr = fast
            let tmp = slow?.next
            slow?.next = fast
            slow = tmp
            fast = fast?.next
        }
        return head
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var curr: ListNode? = head
        var prev: ListNode? = nil
        while curr != nil {
            let tmp = curr?.next
            curr?.next = prev
            prev = curr
            curr = tmp
        }
        return prev
    }
}



class Solution143X3 {
    func reorderList(_ head: ListNode?) {
        if head == nil || head?.next == nil {
            return
        }
        
        var p1: ListNode? = head
        var p2: ListNode? = head
        while p2?.next != nil && p2?.next?.next != nil {
            p1 = p1?.next
            p2 = p2?.next?.next
        }
        
        //reverse the 2nd half
        let preMiddle: ListNode? = p1
        let preCur: ListNode? = p1?.next
        while preCur?.next != nil {
            let cur = preCur?.next
            preCur?.next = cur?.next
            cur?.next = preMiddle?.next
            preMiddle?.next = cur
        }
        
        // reconstruct the link
        p1 = head
        p2 = preMiddle?.next
        while p1 !== preMiddle {
            preMiddle?.next = p2?.next
            p2?.next = p1?.next
            p1?.next = p2
            p1 = p2?.next
            p2 = preMiddle?.next
        }
    }
}

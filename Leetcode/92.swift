/***
 92. Reverse Linked List II
 Medium

 Reverse a linked list from position m to n. Do it in one-pass.
 
 Note: 1 ≤ m ≤ n ≤ length of list.
 
 Example:
 
 Input: 1->2->3->4->5->NULL, m = 2, n = 4
 Output: 1->4->3->2->5->NULL
 ***/



class Solution92x1 {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        let dummy = ListNode(0)
        dummy.next = head
        
        var pre: ListNode? = dummy
        for _ in 0..<(m - 1) {
            pre = pre?.next
        }
        
        let start: ListNode? = pre?.next
        var end: ListNode? = start?.next
        for _ in 0..<(n - m) {
            start?.next = end?.next
            end?.next = pre?.next
            pre?.next = end
            end = start?.next
        }
        return dummy.next
    }
}



class Solution92x2 {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        guard head != nil && m < n else {
            return head
        }
        let dummyHead = ListNode(0)
        dummyHead.next = head
        var left = dummyHead
        var end = dummyHead
        for i in 0..<n {
            if i == m - 1 {
                left = end
            }
            end = end.next!
        }
        let start = left.next!
        var newStart = start
        while newStart !== end {
            let nextNext = start.next?.next
            left.next = start.next!
            start.next!.next = newStart
            newStart = start.next!
            start.next = nextNext
        }
        return dummyHead.next
    }
}



class Solution92x3 {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if head == nil { return nil }
        var count = 1
        var current = head
        var last: ListNode? = nil //last表示已经反转好的部分链表的头结点
        var start: ListNode? = nil  //start表示开始反转的节点前一个节点
        var end: ListNode? = head     //end表示反转部分的最后一个节点
        while current != nil {
            if count < m {
                start = current
                current = current?.next
                end = current
            } else if count < n + 1 {
                let next = current?.next
                current?.next = last
                last = current
                current = next
            } else {
                break
            }
            count += 1
        }
        end?.next = current
        start?.next = last
        if m == 1 {
            return last
        } else {
            return head
        }
    }
}

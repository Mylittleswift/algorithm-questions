/***
 2. Add Two Numbers
 Medium

 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
***/

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution2x1 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var c1: ListNode? = l1
        var c2: ListNode? = l2
        if c1==nil {return c2!}
        if c2==nil {return c1!}
        let sentinel = ListNode(0)
        var d: ListNode? = sentinel;
        var sum:Int = 0
        while (c1 != nil || c2 != nil) {
            sum /= 10
            if c1 != nil {
                sum += c1!.val
                c1 = c1!.next
            }
            if c2 != nil {
                sum += c2!.val
                c2 = c2!.next
            }
            d!.next = ListNode(sum % 10)
            d = d!.next;
        }
        
        if sum / 10 == 1
        {
            d!.next = ListNode(1)
        }
        return sentinel.next
    }
}


class Solution2x2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var carry = 0
        var sum = 0
        var result = ListNode(0)
        let head = result
        
        while l1 != nil || l2 != nil || carry != 0 {
            let current = ListNode(0)
            sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            current.val = sum % 10
            carry = sum >= 10 ? 1 : 0
            result.next = current
            result = current
            l1 = l1?.next
            l2 = l2?.next
        }
        return head.next
    }
}


class Solution2x3 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var addition = 0
        var tn1 = l1
        var tn2 = l2
        var lastRN = ListNode(0)
        var ret: ListNode? = nil
        while tn1 != nil || tn2 != nil || addition > 0 {
            let rn = ListNode(0)
            if tn1 != nil || tn2 != nil {
                rn.val = ((tn1?.val ?? 0) + (tn2?.val ?? 0) + addition) % 10
                addition = ((tn1?.val ?? 0) + (tn2?.val ?? 0) + addition) / 10
            } else {
                rn.val = addition
                addition = 0
            }
            
            if tn1 === l1 || tn2 === l2 {
                // first time
                ret = rn
                rn.next = nil
            } else {
                lastRN.next = rn
            }
            lastRN = rn
            tn1 = tn1?.next
            tn2 = tn2?.next
        }
        return ret
    }
}



class Solution2x4 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1, let l2 = l2 else {return nil}
        
        let firstNode = ListNode((l1.val + l2.val) % 10)
        var currentNode = firstNode
        var listNode1 = l1.next
        var listNode2 = l2.next
        var addOne = (l1.val + l2.val) > 9
        while listNode1 != nil || listNode2 != nil {
            var sum = (listNode1?.val ?? 0) + (listNode2?.val ?? 0)
            sum += addOne ? 1 : 0
            let nextNode = ListNode(sum % 10)
            currentNode.next = nextNode
            currentNode = nextNode
            addOne = sum > 9
            listNode1 = listNode1?.next
            listNode2 = listNode2?.next
        }
        
        if addOne { currentNode.next = ListNode(1) }
        
        return firstNode
    }
}


class Solution2x5 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var l1 = l1, l2 = l2, carry = 0, current = dummy
        while l1 != nil || l2 != nil || carry > 0 {
            let sum = (l1 == nil ? 0 : l1!.val) + (l2 == nil ? 0 : l2!.val) + carry
            // sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            current.next = ListNode(sum % 10)
            current = current.next!
            l1 = l1?.next
            l2 = l2?.next
            carry  = sum / 10
        }
        return dummy.next
    }
}

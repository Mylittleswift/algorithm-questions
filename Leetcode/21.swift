/***
 21. Merge Two Sorted Lists
 Easy

 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
 
 Example:
 
 Input: 1->2->4, 1->3->4
 Output: 1->1->2->3->4->4
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


class Solution21x1 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        //如果一个链表为空，则直接返回另一个
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        //判断链表大小，将小的链表连接到大的链表
        //使用递归，效率最高
        if l1!.val > l2!.val {
            //链表1大于链表2
            l2?.next = mergeTwoLists(l2?.next, l1)
            return l2
        } else {
            //链表2大于链表1
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        }
    }
}

// LC PASSED
class Solution21x2 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var node = dummy
        var l1 = l1
        var l2 = l2
        
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                node.next = l1
                l1 = l1!.next
            } else {
                node.next = l2
                l2 = l2!.next
            }
            node = node.next!
        }
        node.next = l1 ?? l2
        return dummy.next
    }
}

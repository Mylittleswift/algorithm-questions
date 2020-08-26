/***
 23. Merge k Sorted Lists
 Hard

 Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
 
 Example:
 
 Input:
 [
 1->4->5,
 1->3->4,
 2->6
 ]
 Output: 1->1->2->3->4->4->5->6
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

class Solution23x1 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        var ar = [Int]()
        for i in 0..<lists.count {
            var node = lists[i]
            while node != nil {
                ar.append(node!.val)
                node = node!.next
            }
        }
        if ar.count == 0 {
            return nil
        }
        ar = ar.sorted()
        let head = ListNode(ar[0])
        var node = head
        for i in 1..<ar.count {
            node.next = ListNode(ar[i])
            node = node.next!
        }
        return head
    }
}



class Solution23x2 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else {
            return nil
        }
        var values = [Int]()
        for list in lists {
            var head = list
            while head != nil {
                values.append(head!.val)
                head = head!.next
            }
        }
        values = values.sorted()
        let result = ListNode(0)
        var temp: ListNode? = result
        for value in values {
            temp?.next = ListNode(value)
            temp = temp?.next
        }
        return result.next
    }
}



class Solution23x3 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else { return nil }
        guard lists.count > 1 else { return lists[0] }
        let left = mergeKLists(Array(lists[0..<(lists.count / 2)]))
        let right = mergeKLists(Array(lists[((lists.count / 2))...]))
        return mergeTwoLists(left, right)
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let prehead = ListNode(-1)
        var prev: ListNode? = prehead
        var l1Node: ListNode? = l1
        var l2Node: ListNode? = l2
        while let l1 = l1Node, let l2 = l2Node {
            if l1.val <= l2.val {
                prev?.next = l1
                l1Node = l1.next
            } else {
                prev?.next = l2
                l2Node = l2.next
            }
            prev = prev?.next
        }
        
        prev?.next = l1Node ?? l2Node;
        
        return prehead.next
    }
}



class Solution23x4 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else{
            return nil
        }
        var left = 0
        var right = lists.count - 1
        var _lists = lists
        while right > 0 {
            left = 0
            while left < right {
                _lists[left] = merge2Lists(_lists[left], _lists[right])
                left += 1
                right -= 1
            }
        }
        return _lists[0]
    }
    
    func merge2Lists(_ l1: ListNode?, _ l2: ListNode?) ->ListNode? {
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



class Solution23x5 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var resultNumbers = [Int]()
        for linkedList in lists {
            var currentNode = linkedList
            while currentNode != nil {
                resultNumbers.append(currentNode!.val)
                currentNode = currentNode!.next
            }
        }
        resultNumbers = resultNumbers.sorted()
        let result = ListNode(-1)
        var currentResultNode = result
        for num in resultNumbers {
            currentResultNode.next = ListNode(num)
            currentResultNode = currentResultNode.next!
        }
        return result.next
    }
}



class Solution23x6 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil;
        }
        var listArray = [ListNode]()
        for listNode in lists {
            var listNode = listNode
            while listNode != nil {
                listArray.append(listNode!);
                listNode = listNode?.next;
            }
        }
        if listArray.count < 1 {
            if listArray.count == 0 {
                return nil
            } else {
                return listArray[0]
            }
        }
        listArray.sort { (list1, list2) -> Bool in
            list1.val < list2.val
        }
        for index in 0 ..< (listArray.count - 1) {
            let node = listArray[index]
            node.next = listArray[index + 1]
        }
        let node = listArray[listArray.count - 1]
        node.next = nil;
        return listArray[0]
    }
}



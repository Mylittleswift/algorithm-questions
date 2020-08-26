/***
 19. Remove Nth Node From End of List
 Medium

 Given a linked list, remove the n-th node from the end of list and return its head.
 
 Example:
 
 Given linked list: 1->2->3->4->5, and n = 2.
 
 After removing the second node from the end, the linked list becomes 1->2->3->5.
 Note:
 
 Given n will always be valid.
 
 Follow up:
 
 Could you do this in one pass?
 ***/


// Definition for singly-linked list.
//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
// }


// LC PASSED
class Solution19x1 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var endPointer : ListNode? = head
        var nFromEndPointer : ListNode? = nil
        var counter = n
        
        while endPointer != nil {
            if counter == 0 {
                if nFromEndPointer == nil {
                    nFromEndPointer = head
                } else {
                    nFromEndPointer = nFromEndPointer?.next
                }
            }
            endPointer = endPointer?.next
            if counter > 0 {
                counter -= 1
            }
        }
    
        if nFromEndPointer == nil {
            if counter == 0 {
                return head?.next
            }
            return nil
        } else {
            nFromEndPointer?.next = nFromEndPointer?.next?.next
        }
        return head
    }
}


// LC PASSED
class Solution19x2 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        var slow: ListNode? = dummy
        var fast: ListNode? = dummy
        slow?.next = head
        for _ in 1...(n + 1) {
            fast = fast?.next
        }
        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        slow?.next = slow?.next?.next
        return dummy.next
    }
}


class Solution19x3 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        if n == 1 && head.next == nil {
            return nil
        }
        var cur: ListNode? = head
        var last: ListNode? = head
        for _ in 1..<n {
            last = last?.next
        }
        var prev: ListNode?
        while last?.next != nil  {
            prev = cur
            cur = cur?.next
            last = last?.next
        }
        prev?.next = prev?.next?.next
        return  prev == nil ? head.next : head
    }
}


class Solution19x4 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let result:ListNode? = head;
        var tempNode:ListNode? = result
        var tempNode2:ListNode? = result
        if head != nil {
            return head
        }
        
        var i = 0;
        while i < n && tempNode!.next != nil {
            tempNode = tempNode!.next;
            i += 1
        }
        while (tempNode!.next != nil) {
            i += 1
            tempNode = tempNode!.next;
            tempNode2 = tempNode2!.next;
        }
        if (i + 1 == n) {
            return result!.next
        } else {
            tempNode2!.next = tempNode2!.next!.next;
            return result
        }
    }
}



class Solution19x5 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let _ = head else {
            return nil
        }
        
        var preNode = head
        var curNode = head
        var count: Int = 0
        while count < n {
            curNode = curNode?.next
            count += 1
        }
        if curNode == nil {
            return preNode?.next
        }
        
        while let _ = curNode?.next {
            preNode = preNode?.next
            curNode = curNode?.next
        }
        
        preNode?.next = preNode?.next?.next
        return head
    }
}



class Solution19x6 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var resultArray = [ListNode]()
        var tmpNode = head
        var resultNode = head
        repeat {
            resultArray.append(tmpNode!)
            tmpNode = tmpNode?.next
        }while tmpNode != nil
        
        let arrayCount = resultArray.count
        if arrayCount == n {
            resultNode = head?.next
            return resultNode
        }
        resultArray[arrayCount - n - 1].next = resultArray[arrayCount - n].next
        return resultNode
    }
}

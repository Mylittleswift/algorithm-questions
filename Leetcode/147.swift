/***
 147. Insertion Sort List
 Medium
 
 549
 
 555
 
 Add to List
 
 Share
 Sort a linked list using insertion sort.
 
 
 A graphical example of insertion sort. The partial sorted list (black) initially contains only the first element in the list.
 With each iteration one element (red) is removed from the input data and inserted in-place into the sorted list
 
 
 Algorithm of Insertion Sort:
 
 Insertion sort iterates, consuming one input element each repetition, and growing a sorted output list.
 At each iteration, insertion sort removes one element from the input data, finds the location it belongs within the sorted list, and inserts it there.
 It repeats until no input elements remain.
 
 Example 1:
 
 Input: 4->2->1->3
 Output: 1->2->3->4
 Example 2:
 
 Input: -1->5->3->4->0
 Output: -1->0->3->4->5
 ***/




class Solution147x1 {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        let dummyHead = ListNode(-1)
        var sortedNodeIdx: ListNode? = dummyHead
        var curr = head
        
        while let _ = curr {
            while let sortedNodeIdxNext = sortedNodeIdx?.next,
                sortedNodeIdxNext.val < curr!.val {
                    sortedNodeIdx = sortedNodeIdxNext
            }
            
            let currNext = curr?.next
            let sortedNodeIdxNext = sortedNodeIdx?.next
            sortedNodeIdx?.next = curr
            curr?.next = sortedNodeIdxNext
            sortedNodeIdx = dummyHead
            curr = currNext
        }
        
        return dummyHead.next
    }
}



class Solution147x2 {
    
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        var result: ListNode? = nil
        var cur: ListNode? = head
        while let curSafe = cur {
            let newNode = ListNode(curSafe.val)
            guard let resultSafe = result else {
                result = newNode
                cur = curSafe.next
                continue
            }
            if resultSafe.val > curSafe.val {
                let resultOld = resultSafe
                result = newNode
                newNode.next = resultOld
                cur = curSafe.next
                continue
            }
            var insertPos: ListNode? = result
            while insertPos?.next != nil && insertPos!.next!.val < curSafe.val {
                insertPos = insertPos?.next
            }
            newNode.next = insertPos?.next
            insertPos?.next = newNode
            cur = cur?.next
        }
        return result
    }
}



class Solution147x3 {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        let dummyNode = ListNode(-1)
        dummyNode.next = head
        var sortedIdx: ListNode? = dummyNode
        var currNode = head?.next
        head?.next = nil
        
        while currNode != nil {
            while sortedIdx?.next != nil {
                if currNode!.val < sortedIdx!.next!.val {
                    let sortedNext = sortedIdx?.next
                    let currNext = currNode?.next
                    sortedIdx?.next = currNode
                    currNode?.next = sortedNext
                    currNode = currNext
                    sortedIdx = dummyNode
                    break
                } else {
                    sortedIdx = sortedIdx?.next
                    if sortedIdx?.next == nil {
                        // currNode is the biggest one in the sortedLinkedList
                        let currNext = currNode?.next
                        sortedIdx?.next = currNode
                        currNode?.next = nil
                        currNode = currNext
                        sortedIdx = dummyNode
                        break
                    }
                }
            }
        }
        
        return dummyNode.next
    }
}

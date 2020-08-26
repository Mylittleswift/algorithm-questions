/***
 148. Sort List
 Medium
 
 2466
 
 121
 
 Add to List
 
 Share
 Sort a linked list in O(n log n) time using constant space complexity.
 
 Example 1:
 
 Input: 4->2->1->3
 Output: 1->2->3->4
 Example 2:
 
 Input: -1->5->3->4->0
 Output: -1->0->3->4->5
 ***/




class Solution148x1 {
    func sortList(_ head: ListNode?) -> ListNode? {
        var arr = [Int]()
        var cur = head
        
        while cur != nil {
            arr.append(cur!.val)
            cur = cur!.next
        }
        
        arr.sort()
        
        if arr.count < 2 {
            return head
        } else {
            
            var head = ListNode(arr[0])
            var curr: ListNode? = head
            
            for i in 1..<arr.count {
                curr?.next = ListNode(arr[i])
                curr = curr?.next
            }
            
            return head
        }
    }
}



class Solution148x2 {
    func sortList(_ head: ListNode?) -> ListNode? {
        var nums = [Int]()
        var node = head
        
        while node != nil {
            nums.append(node!.val)
            node = node!.next
        }
        
        nums.sort()
        
        var mockNode = ListNode(0)
        node = mockNode
        
        for num in nums {
            node?.next = ListNode(num)
            node = node?.next
        }
        
        return mockNode.next
        
    }
}


extension ListNode {
    func length() -> Int {
        return 1 + (self.next?.length() ?? 0)
    }
}

class Solution148x3 {
    func sortList(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        return divideAndMerge(head, length: head.length())
    }
    
    func divideAndMerge(_ head: ListNode?, length: Int) -> ListNode? {
        guard length > 1 else {
            return head
        }
        
        let mid: ListNode? = {
            var current = head
            var previous = head
            for _ in 0..<length / 2 {
                previous = current
                current = current?.next
            }
            previous?.next = nil
            return current
        }()
        
        let left = divideAndMerge(head, length: length / 2)
        let right = divideAndMerge(mid, length: length - (length / 2))
        return merge(left, mid: right)
    }
    
    func merge(_ head: ListNode?, mid: ListNode?) -> ListNode? {
        var head = head
        var mid = mid
        var mergedList: ListNode?
        var endNode: ListNode?
        
        while let headNode = head, let midNode = mid {
            var currentNode: ListNode!
            if headNode.val < midNode.val {
                currentNode = headNode
                head = headNode.next
                headNode.next = nil
            } else {
                currentNode = midNode
                mid = midNode.next
                midNode.next = nil
            }
            if mergedList == nil {
                endNode = currentNode
                mergedList = currentNode
            } else {
                endNode?.next = currentNode
                endNode = currentNode
            }
        }
        if let headNode = head {
            endNode?.next = headNode
        } else {
            endNode?.next = mid
        }
        return mergedList
    }
}

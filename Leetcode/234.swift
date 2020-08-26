/***
 234. Palindrome Linked List
 Easy

 Given a singly linked list, determine if it is a palindrome.
 
 Example 1:
 
 Input: 1->2
 Output: false
 Example 2:
 
 Input: 1->2->2->1
 Output: true
 Follow up:
 Could you do it in O(n) time and O(1) space?
 ***/



class Solution234x1 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var root = head
        var stack = [ListNode]()
        while root != nil {
            stack.append(root!)
            root = root?.next
        }
        
        var low = 0
        var high = stack.count - 1
        
        while low < high {
            let lownode = stack[low]
            let highnode = stack[high]
            
            if lownode.val == highnode.val {
                low += 1
                high -= 1
            } else {
                return false
            }
        }
        return true
    }
}



class Solution234x2 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        var reverse: ListNode? = nil
        
        while fast?.next != nil {
            fast = fast!.next!.next
            let next = slow!.next
            slow!.next = reverse
            reverse = slow
            slow = next
        }
        if fast != nil {
            slow = slow!.next
        }
        
        while slow != nil {
            if slow!.val != reverse!.val {
                return false
            }
            slow = slow!.next
            reverse = reverse!.next
        }
        
        return true
    }
}



class Solution234x3 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        var reverse: [Int] = [Int]()
        reverse.reserveCapacity(100)
        
        while fast?.next != nil {
            fast = fast!.next!.next
            reverse.append((slow?.val)!)
            slow = slow?.next
        }
        if fast != nil {
            slow = slow!.next
        }
        
        while slow != nil {
            if slow!.val != reverse.popLast() {
                return false
            }
            slow = slow!.next
        }
        
        return true
    }
}



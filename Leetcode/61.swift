/***
 61. Rotate List
 Medium

 Given a linked list, rotate the list to the right by k places, where k is non-negative.
 
 Example 1:
 
 Input: 1->2->3->4->5->NULL, k = 2
 Output: 4->5->1->2->3->NULL
 Explanation:
 rotate 1 steps to the right: 5->1->2->3->4->NULL
 rotate 2 steps to the right: 4->5->1->2->3->NULL
 Example 2:
 
 Input: 0->1->2->NULL, k = 4
 Output: 2->0->1->NULL
 Explanation:
 rotate 1 steps to the right: 2->0->1->NULL
 rotate 2 steps to the right: 1->2->0->NULL
 rotate 3 steps to the right: 0->1->2->NULL
 rotate 4 steps to the right: 2->0->1->NULL
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
class Solution61x1 {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        // Count length
        var l = 0
        var p = head
        var last = p
        while p != nil {
            l += 1
            last = p
            p = p!.next
        }
        
        if l == 0 { return head }
        
        // Rotate
        let dummyHead = ListNode(0)
        dummyHead.next = head
        p = dummyHead
        for _ in 0..<(l - k % l) % l {
            p = p!.next
        }
        let ret = p!.next
        p!.next = nil
        last!.next = dummyHead.next
        return ret
    }
}



class Solution61x2 {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if(head?.next == nil || k == 0){
            return head
        }
        var current = head
        var array = [Int]()
        var n = 0
        while(current != nil){
            array.append(current!.val)
            n += 1
            current = current!.next
        }
        var preHead = ListNode(0)
        current = preHead
        var start = (n - (k % n)) % n
        for i in start ..< (start + n){
            var newNode = ListNode(array[(i % n)])
            current!.next = newNode
            current = current!.next
        }
        return preHead.next
    }
}



class Solution61x3 {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || head?.next == nil || k == 0 {
            return head
        }
        var (fastPtr, slowPtr, length) = (head, head, 1)
        while let _ = fastPtr?.next {   // get list length
            length += 1
            fastPtr = fastPtr?.next
        }
        
        let slowLenth = length - k%length
        for _ in 1..<slowLenth {       // how many steps slowPtr needs to go
            slowPtr = slowPtr?.next
        }
        
        fastPtr?.next = head            // perform rotation
        let newHead = slowPtr?.next
        slowPtr?.next = nil
        
        return newHead;
    }
}



class Solution61x4 {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        /*
         *  思路,首先我们计算出链表的长度,这样据k值可以计算出链表实际移动距离
         *  然后,通过两个指针来记录移动位置
         */
        var length = 0
        var temp = head
        while temp?.next != nil {
            length += 1
            temp = temp?.next
        }
        
        // 长度已经获取length+1
        let stride = k % (length + 1)
        if stride == 0{
            return head
        }
        // stride为实际需要移动的距离
        // 定义两个指针,一个指向链表倒数第stride+1个,一个指向最后一个
        var start: ListNode?
        var end: ListNode?
        var tem: ListNode?
        for index in 0...length{
            if index == 0 {
                tem = head
                end = head
            }else{
                tem = tem?.next
                end = end?.next
            }
            if index == length + 1 - (stride + 1) {
                start = tem
            }
        }
        
        /*
         *  修改节点
         */
        let res = start?.next
        start?.next = nil
        end?.next = head
        
        return res
    }
}

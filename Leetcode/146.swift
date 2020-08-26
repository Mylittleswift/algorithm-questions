/***
 146. LRU Cache
 Medium

 Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.
 
 get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
 put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
 
 The cache is initialized with a positive capacity.
 
 Follow up:
 Could you do both operations in O(1) time complexity?
 
 Example:
 
 LRUCache cache = new LRUCache( 2 /* capacity */ );
 
 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // returns 1
 cache.put(3, 3);    // evicts key 2
 cache.get(2);       // returns -1 (not found)
 cache.put(4, 4);    // evicts key 1
 cache.get(1);       // returns -1 (not found)
 cache.get(3);       // returns 3
 cache.get(4);       // returns 4
 ***/


class LRUCache {
    
    class RecencyNode {
        let key: Int
        var value: Int
        var next: RecencyNode?
        var prev: RecencyNode?
        
        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
    }
    
    var head: RecencyNode?
    var tail: RecencyNode?
    
    var buckets: [Int: RecencyNode]
    
    let capacity: Int
    init(_ capacity: Int) {
        buckets = [Int: RecencyNode]()
        buckets.reserveCapacity(capacity)
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let existing = buckets[key] {
            upgradeRecency(existing)
            return existing.value
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        let node: RecencyNode
        if let existingNode = buckets[key] {
            // value exists for this key, just modify it
            existingNode.value = value
            node = existingNode
        } else {
            // new insert, should check for possible eviction
            if buckets.count == self.capacity {
                evict()
            }
            node = RecencyNode(key: key, value: value)
        }
        
        upgradeRecency(node)
        buckets[key] = node
    }
    
    private func evict() {
        guard let oldHead = head else { return }
        guard buckets.count >= capacity else { return }
        
        self.head = oldHead.next
        if self.head == nil {
            tail = self.head
        }
        
        buckets[oldHead.key] = nil
        oldHead.next = nil
        oldHead.prev = nil
        
    }
    
    private func upgradeRecency(_ node: RecencyNode) {
        
        if let tail = tail {
            if tail === node { return }
            if let head = head, head === node {
                self.head = head.next
            }
            
            node.prev?.next = node.next
            node.next?.prev = node.prev
            node.prev = tail
            node.next = nil
            tail.next = node
            self.tail = tail.next
            
        } else {
            // empty list
            tail = node
            head = tail
        }
    }
}


class DLinkedNode {
    let key: Int
    var value: Int
    var pre: DLinkedNode?
    var next: DLinkedNode?
    
    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}

class LRUCache2 {
    private let dummyHead: DLinkedNode
    private var cache: [Int: DLinkedNode] = [:]
    private var trail: DLinkedNode
    
    private let capacity: Int
    init(_ capacity: Int) {
        self.capacity = capacity
        self.dummyHead = DLinkedNode(key: 0, value: 0)
        self.trail = self.dummyHead
    }
    
    func get(_ key: Int) -> Int {
        if cache[key] == nil {
            return -1
        } else {
            let node = cache[key]!
            hitNode(node)
            return node.value
        }
    }
    
    func hitNode(_ node: DLinkedNode) {
        if node === trail {
            return
        }
        node.pre?.next = node.next
        node.next?.pre = node.pre
        
        trail.next = node
        node.pre = trail
        node.next = nil
        
        trail = trail.next!
    }
    
    func put(_ key: Int, _ value: Int) {
        if cache[key] != nil {
            let node = cache[key]!
            hitNode(node)
            node.value = value
            return
        }
        
        if cache.count < capacity {
            let newNode = DLinkedNode(key: key, value: value)
            
            trail.next = newNode
            newNode.pre = trail
            
            trail = trail.next!
            cache[key] = newNode
        } else {
            let removeNode = dummyHead.next!
            
            dummyHead.next = removeNode.next
            removeNode.next?.pre = dummyHead
            
            cache[removeNode.key] = nil
            let newNode = DLinkedNode(key: key, value: value)
            
            trail.next = newNode
            newNode.pre = trail
            
            trail = trail.next!
            cache[key] = newNode
        }
    }
}

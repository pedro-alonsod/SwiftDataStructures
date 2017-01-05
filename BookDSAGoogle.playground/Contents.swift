//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Node {
    
    var data: Int
    var next: Node?
    
    init(data: Int) {
        
        self.data = data
    }
}

class LinkedList {
    
    var head: Node?
    
    var size: Int {
        
        var c = 0
        var current = head
        
        
            
        if head == nil {
                
            return 0
        } else {
                
            while current != nil {
                
                c += 1
                current = current?.next
            }
            
            return c
        }
        
        
    }
    
    func appendNode(data: Int) {
        
        let current: Node = Node(data: data)
        var look: Node? = head
        
        if head == nil {
            
            head = current
            
        } else {
            
            while look?.next != nil {
                
                look = look?.next
                
                
            }
            
            look?.next = current
        }
        
    }
}

extension LinkedList: CustomStringConvertible {
    
    var description: String {
        
        var desc = "[ "
        var look: Node?
        
        look = head
        
        while look != nil {
            
            desc += "\(look!.data) --> "
            look = look?.next
        }
        
        desc += "nil] size: \(self.size)"
        
        return desc
    }
}

var testLinked: LinkedList = LinkedList()
testLinked.size
testLinked.appendNode(data: 1)
testLinked.appendNode(data: 2)
testLinked.appendNode(data: 3)

print(testLinked)



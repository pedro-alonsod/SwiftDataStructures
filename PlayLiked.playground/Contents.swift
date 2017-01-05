//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Node {
    
    var key:String
    var next: Node?
    
    init(key: String) {
        
        self.key = key
        
    }
}

var newNode = Node(key: "test")

let nextNode = Node(key: "next")

newNode.next = nextNode

class LinkedListString {
    
    var head: Node?
    var tail: Node?
    
    var count = 0
    
    func addNext(key: String)  {
        
        
        if head == nil {
            
            let node = Node(key: key)
            head = node
            tail = node
            self.count += 1
            return
            
        } else {
            
            var getNext = head
            
            while getNext?.next != nil {
                
                getNext = getNext?.next
                
            }
            
            let node = Node(key: key)
            getNext?.next = node
            tail = node
            
            
        }
        
        count += 1
    }
    
    func deleteLast() -> Node? {
        
        var nodeToReturn: Node?
        var previous: Node?
        var nextNode = head
        
        
        if head == nil {
            
            return head
        } else {
            
            
            
            while nextNode!.next != nil {
                
                previous = nextNode
                print(previous!.key)
                nextNode = nextNode?.next
                
            }
            
            
        }
        
        previous?.next = nil
        
        //print(nextNode?.key)
        self.count -= 1
        return nextNode
    }
    
    func deleteAtIndex(atIndex index: Int) -> Node? {
        
        
        var current: Node? = head
        var previous: Node? = nil
        var next: Node?
        var thisIndex = index
        
        guard thisIndex >= 0 else { return nil }
        
        guard thisIndex <= self.count else { return nil }
        
        if thisIndex == 1 {
            
            self.head = current?.next
            //self.count -= 1
            
        }
        
        while thisIndex > 1 {
            
            previous = current
            //print("previos \(previous?.key)")
            current = current?.next
            //print("current \(current?.key)")
            next = current?.next
//            print("next \(next?.key)")
//            print(thisIndex)
            thisIndex -= 1
            
        }
        
        previous?.next = next
        
        self.count -= 1
    
        return current
    }
    

    func appendNode(key: String) {
    
    
        let newAppendedNode: Node? = Node(key: key)
        newAppendedNode?.next = nil
        
        if self.count == 0 {
            
            head = newAppendedNode
            
        } else {
            
            var current = head
            
            while current?.next != nil {
                
                print(current!.key)
                current = current?.next
            }
            
            current?.next = newAppendedNode
            tail = newAppendedNode
        }
        
        self.count += 1
    
    }
    
    func insertNodeAtIndex(key: String, index: Int) {
        
        var newNode: Node? = Node(key: key)
        var thisIndex = index
        
        guard thisIndex != 0 || thisIndex <= self.count else {
            return
        }
        
        if thisIndex == 1 {
            
            newNode?.next = head
            head = newNode
            
        }
        
        if thisIndex == self.count {
            
            self.appendNode(key: key)
            self.count -= 1
        }
        
        self.count += 1
        
    }
    
    func retunrNodes(index: Int) -> (previous: Node?, current: Node?, next: Node?) {
        
        var thisIndex = index
        var current = self.head
        var previous: Node? = nil
        var next: Node? = nil
        
        guard thisIndex != 0 || thisIndex <= self.count else {
            
            return (nil, nil, nil)
        }
        print("here")
        
        if thisIndex == 1 {
            
            previous = current
            next = current?.next
        }
        
        
        
        return (previous, current, next)
        
        
    }
    
    subscript(index: Int) -> Node? {
        
        get {
            
            var thisIndex = index
            print(thisIndex)
            
            guard thisIndex > 0 || thisIndex <= self.count else { return nil }

            var current: Node?
            
            if thisIndex == 1 {
                
                current = head
            } else {
                
                current = head
                
                while thisIndex > 1 {
                    
                    current = current?.next
                    thisIndex -= 1
                }
            }
            
            
            return (current)!
        }
        set(newValue) {
           
        }
        
    }
    
    func removeTail() {
        
        if self.head === self.tail {
            
            self.head = nil
            self.tail = nil
        }
        
        var current = head
        
        while current?.next?.next != nil {
            
            current = current?.next
        }
        
        tail = current
        current?.next = nil
        self.count -= 1
    }
    
    
}

extension LinkedListString: CustomStringConvertible {
    
    var description: String {
        
        var start: String = "head="
        
        if self.head == nil {
            
            start = "Nothing to show"
        } else {
            
            var nextNodeToPrint: Node? = self.head
            
            while nextNodeToPrint != nil {
                
                if nextNodeToPrint?.next === tail {
                    start += "tail="
                } else {

                    start += "\(nextNodeToPrint!.key) -->"
                }
//                start += "\(nextNodeToPrint!.key) -->"
                
                
                nextNodeToPrint = nextNodeToPrint?.next
                
//                if nextNodeToPrint?.next == nil {
//                    tail = nextNodeToPrint
                
//                }
                
            }
            
            start += "nil:count = \(self.count)"
        }
        
        
        return start
        
    }
}

var testList: LinkedListString = LinkedListString()

testList.addNext(key: "uno")
testList.addNext(key: "dos")
testList.addNext(key: "tres")
testList.addNext(key: "cuatro")
testList.addNext(key: "cinco")
testList.addNext(key: "seis")

//print(testList)
//testList.deleteLast()!
//print(testList)
//
//testList.deleteAtIndex(atIndex: 3)
//
//print(testList)

testList.deleteAtIndex(atIndex: 6)

print(testList)

testList.appendNode(key: "seis")

print(testList)

testList.insertNodeAtIndex(key: "siete", index: 6)

print(testList)


print(testList[2]!.key)

testList.removeTail()

print(testList)


class BinaryTreeInt {
    
    var value: Int
    var left: BinaryTreeInt?
    var right: BinaryTreeInt?
    var parent: BinaryTreeInt?
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    init(value:Int) {
        
        self.value = value
    }
    
    func insert(value: Int) {
        
        lookForSpace(value: value, parent: self)
        
    }
    
    func lookForSpace(value: Int, parent: BinaryTreeInt?) {
        
        if value < self.value {
            
            if let left = left {
                
                left.lookForSpace(value: value, parent: left)
            } else {
                
                left = BinaryTreeInt(value: value)
                left?.parent = parent
            }
            
        } else {
            
            if let right = self.right {
                
                right.lookForSpace(value: value, parent: right)
            } else {
                
                right = BinaryTreeInt(value: value)
                right?.parent = parent
            }
        }
    }
    
    func findNode(value: Int) -> BinaryTreeInt? {
        
        let node = searchValue(value: value, parent: self)
        
        if node != nil {
            
            print("node found")
        } else {
            
            print("node not found")
        }
        
        return node
    }
    
    func searchValue(value: Int, parent: BinaryTreeInt?) -> BinaryTreeInt? {
        
        var nodeLookedFor: BinaryTreeInt?
        
        if value == self.value {
            
            nodeLookedFor = self
            
        } else if value < self.value {
            
            nodeLookedFor = left?.searchValue(value: value, parent: left)
        } else if value > self.value {
            
           nodeLookedFor = right?.searchValue(value: value, parent: right)
        } else {
            
           //nodeLookedFor = nil
        }
    
        return nodeLookedFor
    }
    
    func preorder() {
        
        print("\(self.value)")
        
        self.left?.preorder()
        
        self.right?.preorder()
    }
    
    func preorderNoRecursion() {
        
        var current: BinaryTreeInt? = self
        var currentR: BinaryTreeInt? = self.right
        //print("\(current?.value)")
        
        while current != nil {
            
            print("\(current?.value)")
            current = current?.left
        }
        
        while currentR != nil {
            print(current?.value)
            currentR = currentR?.right
        }
    }
    
    func lowestCommonAncestor(value1: Int, value2: Int) {
        
        var current: BinaryTreeInt? = self
        
        if (value1 < (current?.value)!) && (value2 < (current?.value)!)  {
            
            self.left?.lowestCommonAncestor(value1: value1, value2: value2)
            
        } else if ((value1 > (current?.value)!) && (value2 > (current?.value)!)) {
            
            self.right?.lowestCommonAncestor(value1: value1, value2: value2)
        } else {
            
            print("found \(current?.value)")
        }
    }
    
}


extension BinaryTreeInt: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = self.left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = self.right {
            s += " -> (\(right.description))"
        }
        return s
    }
}

let treeTest = BinaryTreeInt(value: 20)
treeTest.insert(value: 8)
treeTest.insert(value: 22)
treeTest.insert(value: 4)
treeTest.insert(value: 12)
treeTest.insert(value: 10)
treeTest.insert(value: 14)
//treeTest.insert(value: 110)

print(treeTest)

print(treeTest.findNode(value: 4))

treeTest.preorder()

print("*****".characters)

treeTest.preorderNoRecursion()

treeTest.lowestCommonAncestor(value1: 4, value2: 14)

var stringExample: String = "teeter"

var asDict: [String : Int] = Dictionary()

for i in stringExample.characters {
    
    print(i)
    asDict["\(i)"] = 1 + (asDict["\(i)"] ?? 0)
    //asDict[i] += 1
}
print(asDict)

var asArray: [String] = asDict.map { "\($0) \($1)" }
print(asArray)

print(asDict.filter { $1 == 1})

print(asDict.reduce("") { $0 })



//


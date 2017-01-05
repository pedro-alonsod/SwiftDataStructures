//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Node {
    
    var data: String
    var next: Node?
    
    init(data: String) {
        
        self.data = data
    }
}

class LLStr {
    
    var head: Node?
    
    func anddNode(data: String) {
        
        var newNode = Node(data: data)
        
        if head == nil {
            
            head = newNode
        } else {
            
            var current = head
            
            while current?.next != nil {
                
                current = current?.next
                
            }
         
            current?.next = newNode
        }
    }
    
    func reverseWords(lista: LLStr) -> LLStr {
        
        var blanks:[Node?] = []
        
        var current = self.head
        
        while current != nil {
            
            if current?.data == " " {
                
                blanks.append(current)
            }
            
            current = current?.next
        }
        
        current = self.head
        current?.data
        
        blanks.count
        
        for i in 0..<blanks.count {
            
            var previous = (blanks.count != 0) ? blanks[i] : nil
            var next: Node?
            
//            while current?.data != " " || current != nil {
//                
//                next = current?.next
//                
//                current?.next = previous
//                previous = current
//                current = next
//            }


        
            
            
//            if i == 0 {
//                
                head = previous
//            }
//            
            current = current?.next
            
            
            
        }
        
        return self
    }
}

extension LLStr: CustomStringConvertible {
    
    var description: String {
        
        var desc = "[ "
        var look: Node?
        
        look = head
        
        while look != nil {
            
            desc += "\(look!.data) --> "
            look = look?.next
        }
        
        desc += "nil] "
        
        return desc
    }
}

var test = LLStr()

test.anddNode(data: "H")
test.anddNode(data: "e")
test.anddNode(data: "l")
test.anddNode(data: "l")
test.anddNode(data: "o")
test.anddNode(data: " ")
test.anddNode(data: "w")
test.anddNode(data: "o")
test.anddNode(data: "r")
test.anddNode(data: "l")
test.anddNode(data: "d")

print(test)

test.reverseWords(lista: test)

class BTree {
    
    var data: Int
    var left: BTree?
    var right: BTree?
    var parent: BTree?
    
    init(data: Int) {
        
        self.data = data
    }
    
    func insert(data: Int) {
        
        lookForSpace(data: data, parent: self)
    }
    
    func lookForSpace(data: Int, parent: BTree?) {
        
        
        //cant do it like this if is not bst
        
        if data < self.data {
            
            if let left = self.left {
                
                left.lookForSpace(data: data, parent: self.left)
            } else {
                
                self.left = BTree(data: data)
                self.left?.parent = parent
            }
            
        } else {
            
            if let right = self.right {
                
                right.lookForSpace(data: data, parent: self.right)
            } else {
                
                self.right = BTree(data: data)
                self.right?.parent = parent
            }
            
            
        }
        
        
            
        
    }
    
    func findNode(data: Int) -> BTree? {
        
        let node: BTree? = searchTree(data: data, parent: self)
        
        return node
    }
    
    func searchTree(data: Int, parent: BTree?) -> BTree? {
        
        var node: BTree?
        
        if self.data == data {
            
            node = self
        } else if data < self.data  {
            
            //var left = self.left
            
            node = left?.searchTree(data: data, parent: left)
        } else if data > self.data {
            
            //var right = self.right
            
            node = right?.searchTree(data: data, parent: right)
        }
        
        
        return node
    }
    
    
    
    func remove(data: Int, parent: BTree?) -> BTree? {
        
        var node: BTree? = self
        
        print(node?.data)
        
        
        if node == nil {
            
            return nil
        } else if data < (node?.data)! {
            
            print("node going left: \(node?.data)")
            self.left = self.left?.remove(data: data, parent: self.left)
        } else if data > self.data {
            
            print("going right: \(node?.data)")
            self.right = self.right?.remove(data: data, parent: self.right)
            
        } else {
            
            //case 1: no children
            if node?.left == nil && node?.right == nil {
                
                print("case 1")
                
                var parent = node?.parent
                parent?.right = nil
                node?.parent = nil
                node = nil
                
//                node?.parent = nil
                
                
            }
            //case 2: one right child
            else if node?.left == nil {
            
                print("case 2 one child right")
            } else if node?.right == nil {
                
                print("case 2 one child left")
            }
             //case 3 2 childs
            else {
                 print("case 3 2 children")
            }
        }
        
        
        return node
        
    }
    
    func getMinValue() -> Int {
        
        if self.left == nil {
            
            return self.data
        } else {
            
            return (self.left?.getMinValue())!
        }
        
        return self.data
    }
}

extension BTree: CustomStringConvertible {
    
    public var description: String {
        var s = ""
        if let left = self.left {
            s += "(\(left.description)) <- "
        }
        s += "\(data)"
        if let right = self.right {
            s += " -> (\(right.description))"
        }
        return s
    }
}

var testTree = BTree(data: 11)
testTree.insert(data: 5)
testTree.insert(data: 21)
testTree.insert(data: 3)
testTree.insert(data: 6)
testTree.insert(data: 17)
testTree.insert(data: 28)
testTree.insert(data: 4)

print(testTree)

testTree.findNode(data: 17) ?? nil
testTree.getMinValue()

testTree.remove(data: 4, parent: testTree)

print(testTree)

//






//
//437. Path Sum III   QuestionEditorial Solution  My Submissions
//Total Accepted: 7028
//Total Submissions: 18415
//Difficulty: Easy
//Contributors: Stomach_ache
//You are given a binary tree in which each node contains an integer value.
//
//Find the number of paths that sum to a given value.
//
//The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).
//
//The tree has no more than 1,000 nodes and the values are in the range -1,000,000 to 1,000,000.
//
//Example:
//
//root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8

var root: [Int?] = [10,5,-3,3,2,nil,11,3,-2,nil,1]

print(root)

//it is found that if n is the number or index of a node, then its left child occurs at (2n + 1)th position & right child at (2n + 2) th position of the array. If any node does not have any of its child, then null value is stored at the corresponding index of the array.
for (idx, value) in root.enumerated() {
    
    if 2*idx+1 < root.count && 2*idx+2 < root.count {
        
        print(" idx = n \(idx), value \(value ?? 0) children = (2n+1) \(root[2*idx+1]) and (2*n+2) \(root[2*idx+2])")
        
        
//    
//        if value ?? 0 + root[2*idx+1]! == 8 {
//            
//            print("8 left")
//        } else if value ?? 0 + root[2*idx+2]! == 8 {
//            
//            print("8 right")
//        }
        
    } else {
        
        print("we are at a leaf")
    }
    
}

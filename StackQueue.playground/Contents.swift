//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// stacks

class NodeInt {
    
    var data: Int
    var next: NodeInt?
    
    init(data: Int) {
        self.data = data
    }
    
}

class Stack {

    var head: NodeInt?
    
    func push(data: Int) {
        
        var item: NodeInt = NodeInt(data: data)
        
        if head == nil {
            
            head = item
            
        } else {
            
            var current = head
            
//            while current?.next != nil {
//                
//                current = current?.next
//                
//            }
//queue ^
    
            //current?.next = item
            //queue
            //for stack
            item.next = current
            head = item
        }
    }
    
    func pop() -> NodeInt? {
        
        if head == nil {
            
            print("Empty stack")
            return nil
        } else {
            
            var current = head
            head = current?.next
            
            return current
        }
    }
}

extension Stack: CustomStringConvertible {
 
    var description: String {
        
        var desc: String = ""
        
        var current = head
        
        while current != nil {
            
            desc += "|\(current!.data)|\n"
            current = current?.next
            
        }
        
        return desc
    }
}

var testStack: Stack = Stack()
testStack.push(data: 1)
testStack.push(data: 2)
testStack.push(data: 3)
testStack.push(data: 4)

print(testStack)

print((testStack.pop()!.data))
print(testStack)
testStack.pop()
testStack.pop()
testStack.pop()
testStack.pop()

var arrayOfTuples: [(Int, String)] = []
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))
arrayOfTuples.append((100000, "abc"))
arrayOfTuples.append((10, "ab"))
arrayOfTuples.append((20, "a"))
arrayOfTuples.append((101, "ab"))

arrayOfTuples
//print(arrayOfTuples)
var names: Set<String> = []
var dictOfNames: [String: Int] = [:]

for tuple in arrayOfTuples {
    
    names.insert(tuple.1)
    if dictOfNames[tuple.1] != nil {
        
        dictOfNames[tuple.1]! += 1
    } else {
    
        dictOfNames[tuple.1] = 0
    }
    
}

print("names \(names)")

var dictOfTuples: [String:Int]

print("dictOfNames \(dictOfNames)")

print(dictOfNames.sorted { $0.1 > $1.1 })

//
//dictOfNames.filter {
//    $0.1 > $1.1
//}

print("arra sorted \(arrayOfTuples.sorted { $0.0 > $1.0 })")

//print(arrayOfTuples)

func mergeSort(_ array: [Int]) ->[Int] {
    
    guard array.count > 1 else { return array }
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftPile: leftArray, rightPile: rightArray)
    
}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
 
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedPile: [Int] = []
    
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        
        if leftPile[leftIndex] < rightPile[rightIndex] {
            
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        
    }
    
    while leftIndex < leftPile.count {
            
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
        
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    return orderedPile
}

var mergeSortArray: [Int] = [1,4,6,2,2,3,5,5,6,7,7,8,9,1,2,12,1,2,12,5,6,778,88,13,11,33,44,55,66,77,78,8,888,8888,77,8,89,9,9,22,9,9,9,9,34,7,5,45,54]

mergeSort(mergeSortArray)


var dictOfTuplesPro: [String : [Int]] = [:]

for tuple in arrayOfTuples {
    
    if dictOfTuplesPro[tuple.1] != nil {
        
        dictOfTuplesPro[tuple.1]! += [tuple.0]
    } else {
        
        dictOfTuplesPro[tuple.1] = [tuple.0]
    }
}

print("dictOfTuplesPro \(dictOfTuplesPro)")

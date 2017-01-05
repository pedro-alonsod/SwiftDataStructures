//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Vertex {
    
    var data: Int
    var neighbors: [Edge]
    var previous: Vertex?
    var explored: Bool = false
    
    init() {
        
        self.neighbors = []
        self.data = 0
    }
}

class Edge {
    
    var neigbor: Vertex
    var weigth:  Int
    
    init() {
        
        self.weigth = 0
        self.neigbor = Vertex()
    }
}

class Graph {
    
    var canvas: [Vertex] //or set Set<Int>
    var isDirected: Bool
    
    init() {
        self.canvas = [] //Set<Int>()
        self.isDirected = true
    }
    
    func addVerte(key: Int) -> Vertex {
        
        var childVertex: Vertex = Vertex()
        childVertex.data = key
        
        canvas.append(childVertex)
        return childVertex
    }
    
    func addEdge(source: Vertex, neighbor: Vertex, weight: Int) {
        
        var newEdge: Edge = Edge()
        
        newEdge.neigbor = neighbor
        newEdge.weigth = weight
        source.neighbors.append(newEdge)
        
        if (self.isDirected == false) {
            
            var reversedEdge: Edge = Edge()
            
            reversedEdge.neigbor = source
            reversedEdge.weigth = weight
            neighbor.neighbors.append(reversedEdge)
            
        }
    }
    
    func depthFirstSearch(source: Vertex) -> [String] {
        
        var nodesExplored: [String] = ["\(source.data)"]
        source.explored = true
        
        for e in source.neighbors {
            
            if !e.neigbor.explored {
                
                nodesExplored += self.depthFirstSearch(source: e.neigbor)
            }
        }
         return nodesExplored
        
    }
    
    func processDijkstra(source: Vertex, destination: Vertex) -> Path? {
        
        var frontier: [Path] = []
        var finalPath: [Path] = []
        
        source.explored = true
       
        //new frontier
        var frontierNodes: Set<Vertex> = [source]
        
        var previous: [Vertex] = []
        
        var bestTotal: Int = 0
        
        
        
        //create frontier
        
        for e in source.neighbors {
            
            var newPath: Path = Path()
            newPath.destination = e.neigbor
            newPath.previous = nil
            newPath.total = e.weigth
            
            frontier.append(newPath)
        }
        
        //construct best path
        var bestPath: Path = Path()
        
        while frontier.count != 0 {
            
            //greedy approach
            bestPath = Path()
            var patIndex: Int = 0
            
            for x in 0..<frontier.count {
                
                var itemPath: Path = frontier[x]
                
                if (bestPath.total == nil) || (itemPath.total < bestPath.total) {
                    
                    bestPath = itemPath
                    patIndex = x
                    
                }
            }
            
            //enumerate best path edges
            for e in bestPath.destination.neighbors {
                
                var newPath: Path = Path()
                
                newPath.destination = e.neigbor
                newPath.previous = bestPath
                newPath.total = bestPath.total + e.weigth
                
                //add the newPath to the frontier
                frontier.append(newPath)
                
                
            }
            
            //preserve best path
            finalPath.append(bestPath)
            
            //Remove best path from the frontier
            frontier.remove(at: patIndex)
            
            
        } //end while
        
        //establish the shortest path as an optional
        var shortestPath: Path! = Path()
        
        
        for itemPath in finalPath {
            
            if (itemPath.destination.data == destination.data) {
                
                if  (shortestPath.total == nil) || (itemPath.total < shortestPath.total) {
                    shortestPath = itemPath
                }
                
            }
            
        }
        
        
        return shortestPath
        
    }
}

extension Graph: CustomStringConvertible {
    
    var description: String {
        
        var desc: String = ""
        
        for node in self.canvas {
            
            desc += "\(node.data)--\(node.neighbors)-->"
        }
        
        if self.canvas.isEmpty {
            
            desc = "empty graph"
        }
        
        return desc
    }
}

class Path {
    
    var total: Int!
    var destination: Vertex
    var previous: Path!
    
    init() {
    
        self.destination = Vertex()
    }
    
    
}

extension Vertex: Hashable, Equatable {
    
    var hashValue: Int {
        
        return self.data
    }
    
    static func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }
}

extension Vertex: CustomStringConvertible {
    
    var description: String {
        
        return "\(self.data)"
    }
}


var testGraph: Graph = Graph()

print(testGraph)

testGraph.addVerte(key: 1)

testGraph.addVerte(key: 2)

testGraph.addVerte(key: 3)

testGraph.addVerte(key: 4)

testGraph.addVerte(key: 5)

testGraph.addVerte(key: 6)


testGraph.addEdge(source: testGraph.canvas[0], neighbor: testGraph.canvas[1], weight: 400)

testGraph.addEdge(source: testGraph.canvas[0], neighbor: testGraph.canvas[2], weight: 300)

testGraph.addEdge(source: testGraph.canvas[2], neighbor: testGraph.canvas[1], weight: 10)
testGraph.addEdge(source: testGraph.canvas[1], neighbor: testGraph.canvas[3], weight: 200)
testGraph.addEdge(source: testGraph.canvas[2], neighbor: testGraph.canvas[4], weight: 200)
testGraph.addEdge(source: testGraph.canvas[2], neighbor: testGraph.canvas[5], weight: 150)
testGraph.addEdge(source: testGraph.canvas[3], neighbor: testGraph.canvas[4], weight: 300)
testGraph.addEdge(source: testGraph.canvas[4], neighbor: testGraph.canvas[5], weight: 300)

print(testGraph)

testGraph.canvas[1]

print(testGraph.processDijkstra(source: testGraph.canvas[0], destination: testGraph.canvas[1])!)

testGraph.depthFirstSearch(source: testGraph.canvas[0])









//: [Previous](@previous)

import Foundation

// So Sequences have a PAT and that means we can use them with generics

// To start lets make a Sequnce that takes two other Sequences and returns them one after another in order

public struct Combiner <I: Sequence, K: Sequence> where I.Element == K.Element  {
  
  let s1: I
  let s2: K
  
  init(_ s1: I, _ s2: K) {
    self.s1 = s1
    self.s2 = s2
  }
  
  public func makeIterator() -> CombinedIterator<I, K> {
    return CombinedIterator(s1, s2)
  }
}

public struct CombinedIterator<I: Sequence, K: Sequence> where I.Element == K.Element {
  
  let s1: I
  let s2: K
  
  lazy var s1Itr: I.Iterator = s1.makeIterator()
  lazy var s2Itr: K.Iterator = s2.makeIterator()
  
  init(_ s1: I, _ s2: K){
    self.s1 = s1
    self.s2 = s2
  }
  
  public mutating func next() -> I.Element? {
    if let s1return = s1Itr.next() {
      return s1return
    } else if let s2return = s2Itr.next() {
      return s2return
    } else {
      return nil
    }
  }
}

// Make a Combiner with 2 Arrays of Integers
let combiner = Combiner([1,2,3,4],[7,8,9,0])
// Make an Iterator
var itr = combiner.makeIterator()
// Look here how the Type gets implied all the way through the Code, I can declare it to be of type Int!
while let nextVal: Int = itr.next() {
  print(nextVal)
}


//: [Next](@next)

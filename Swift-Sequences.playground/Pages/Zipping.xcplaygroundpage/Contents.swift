//: Playground - noun: a place where people can play

import Foundation

// Next Up let augment the Combiner into a Zipper that takes two other Sequences (of potentially different sizes) and returns them as one Tuple. If one sequence runs out before the other just continue on with its value being nil

public struct Zipper <I: Sequence, K: Sequence> where I.Element == K.Element  {
  
  let s1: I
  let s2: K
  
  init(_ s1: I, _ s2: K) {
    self.s1 = s1
    self.s2 = s2
  }
  
  public func makeIterator() -> ZipperIterator<I, K> {
    return ZipperIterator(s1, s2)
  }
}

public struct ZipperIterator<I: Sequence, K: Sequence> where I.Element == K.Element {
  
  let s1: I
  let s2: K
  
  lazy var s1Itr: I.Iterator = s1.makeIterator()
  lazy var s2Itr: K.Iterator = s2.makeIterator()
  
  init(_ s1: I, _ s2: K){
    self.s1 = s1
    self.s2 = s2
  }
  
  public mutating func next() -> (I.Element?, I.Element?)? {
    let s1return = s1Itr.next()
    let s2return = s2Itr.next()
    if s1return != nil || s2return != nil {
      return (s1return, s2return)
    } else {
      return nil
    }
  }
}

// Make a Zipper with 2 Arrays of Integers, Try it with different sizes
let zipper = Zipper([1,2,3,4],[7,8,9,0,8])

var itr = zipper.makeIterator()

while let nextVal: (Int?, Int?) = itr.next() {
  print(nextVal)
}



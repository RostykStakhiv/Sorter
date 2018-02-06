//
//  Sorter.swift
//  SortingAlgorithms
//
//  Created by admin on 2/5/18.
//

import Foundation

public class Sorter {
    func bubbleSort<T: Comparable>(array: [T]) -> [T] {
        return array
    }
    
    func insertionSort<T: Comparable>(array: [T]) -> [T] {
        var copyArray = Array(array)
        
        for i in 1..<copyArray.count {
            let currentValue = copyArray[i]
            var holeIndex = i
            while holeIndex > 0 && copyArray[holeIndex - 1] > currentValue {
                copyArray[holeIndex] = copyArray[holeIndex - 1]
                holeIndex = holeIndex - 1
            }
            copyArray[holeIndex] = currentValue
        }
        
        return copyArray
    }
    
    func selectionSort<T: Comparable>(array: inout [T]) {
        for i in 0 ..< array.count - 1 {
            var minElementIndex = i
            var minElement = array[minElementIndex]
            
            for j in i + 1 ..< array.count {
                if array[j] < minElement {
                    minElementIndex = j
                    minElement = array[minElementIndex]
                }
            }
            
            if minElementIndex > i {
                array.swapAt(i, minElementIndex)
            }
        }
    }
}

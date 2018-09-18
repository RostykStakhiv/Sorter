//
//  Sorter.swift
//  SortingExamples
//
//  Created by admin on 11/5/17.
//  Copyright © 2017 rstakhiv. All rights reserved.
//

class Sorter {
    
    //MARK: O(n^2) algorithms
    func bubbleSort<T: Comparable>(array: [T]) -> [T] {
        var sortedArray = Array(array)
        
        for k in 1..<array.count {
            for i in 0..<array.count - k {
                if sortedArray[i] > sortedArray[i+1] {
                    sortedArray.swapAt(i, i + 1)
                }
            }
        }
        
        return sortedArray
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
    
    func selectionSort<T: Comparable>(array: [T]) -> [T] {
        var sortedArray = Array(array)
        
        for i in 0 ..< sortedArray.count - 1 {
            var minElementIndex = i
            var minElement = sortedArray[minElementIndex]
            
            for j in i + 1 ..< array.count {
                if sortedArray[j] < minElement {
                    minElementIndex = j
                    minElement = sortedArray[minElementIndex]
                }
            }
            
            if minElementIndex > i {
                sortedArray.swapAt(i, minElementIndex)
            }
        }
        
        return sortedArray
    }

    //MARK: O(nlogn) algorithms
    func mergeSort<T: Comparable>(array: [T]) -> [T] {
        if array.count < 2 {
            return array
        }
        
        let pivotIndex: Int = array.count / 2
        let leftArray = Array(array[0..<pivotIndex])
        let rightArray = Array(array[pivotIndex..<array.count])
        
        let leftArraySorted = mergeSort(array: leftArray)
        let rightArraySorted = mergeSort(array: rightArray)
        let result = merge(leftArray: leftArraySorted, rightArray: rightArraySorted)
        return result
    }
    
    private func merge<T: Comparable>(leftArray: [T], rightArray: [T]) -> [T] {
        var mergedArray = [T]()
        var leftUnpickedIndex = 0
        var rightUnpickedIndex = 0
        
        while leftUnpickedIndex < leftArray.count && rightUnpickedIndex < rightArray.count {
            if leftArray[leftUnpickedIndex] < rightArray[rightUnpickedIndex] {
                mergedArray.append(leftArray[leftUnpickedIndex])
                leftUnpickedIndex += 1
            } else {
                mergedArray.append(rightArray[rightUnpickedIndex])
                rightUnpickedIndex += 1
            }
        }
        
        for leftArrayLeftoutIndex in leftUnpickedIndex..<leftArray.count {
            mergedArray.append(leftArray[leftArrayLeftoutIndex])
        }
        
        for rightArrayLeftoutIndex in rightUnpickedIndex..<rightArray.count {
            mergedArray.append(rightArray[rightArrayLeftoutIndex])
        }
        
        return mergedArray
    }
    
    func quickSort<T: Comparable>(array: inout [T], start: Int, end: Int) {
        guard start < end else {
            return
        }
        
        let pivotIndex = partitioningFunc(array: &array, start: start, end: end)
        quickSort(array: &array, start: start, end: pivotIndex - 1)
        quickSort(array: &array, start: pivotIndex + 1, end: end)
    }
    
    private func partitioningFunc<T: Comparable>(array: inout [T], start: Int, end: Int) -> Int {
        var partitionIndex = start
        let pivotElement = array[end]
        
        for i in start..<end {
            if array[i] <= pivotElement {
                array.swapAt(i, partitionIndex)
                partitionIndex += 1
            }
        }
        
        array.swapAt(partitionIndex, end) //swap pivot element with element in partition index
        return partitionIndex
    }
}

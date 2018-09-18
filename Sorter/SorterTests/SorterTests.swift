//
//  SorterTests.swift
//  SorterTests
//
//  Created by admin on 2/8/18.
//  Copyright © 2018 rstakhiv. All rights reserved.
//

import XCTest
@testable import Sorter

class SorterTests: XCTestCase {
    
    let sorter = Sorter()
    var unsortedArray: [Int] = [Int]()
        
    override func setUp() {
        super.setUp()
        
        for _ in 0..<10 {
            unsortedArray.append(Int(arc4random_uniform(50)))
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInsertionSort() {
        let sortedArray = sorter.insertionSort(array: unsortedArray)
        XCTAssert(isArraySorted(sortedArray), sortedArray.description)
    }
    
    func testSelectionSort() {
        let sortedArray = sorter.selectionSort(array: unsortedArray)
        XCTAssert(isArraySorted(sortedArray), sortedArray.description)
    }
    
    func testBubbleSort() {
        let sortedArray = sorter.bubbleSort(array: unsortedArray)
        XCTAssert(isArraySorted(sortedArray), sortedArray.description)
    }
    
    func testMergeSort() {
        let sortedArray = sorter.mergeSort(array: unsortedArray)
        XCTAssert(isArraySorted(sortedArray), sortedArray.description)
    }
    
    func testQuickSort() {
        var unsortedArrayCopy = Array(unsortedArray)
        sorter.quickSort(array: &unsortedArrayCopy, start: 0, end: unsortedArrayCopy.count - 1)
        XCTAssert(isArraySorted(unsortedArrayCopy), unsortedArrayCopy.description)
    }
    
    func testFunc() {
        sorter.testFunc()
    }
    
    private func isArraySorted<T: Comparable>(_ array: [T]) -> Bool {
        for i in 0..<array.count - 1 {
            if array[i] > array[i+1] {
                return false
            }
        }
        
        return true
    }
    
}

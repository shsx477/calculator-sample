//
//  Calculator_1Tests.swift
//  Calculator-1Tests
//
//  Created by 한선수 on 2020/05/20.
//  Copyright © 2020 한선수. All rights reserved.
//

import XCTest
@testable import Calculator_1

class Calculator_1Tests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    
    func testCalculation_1() {
        let calcHelper = CalculationHelper()
        
        XCTAssertTrue(calcHelper.sendInput("1") == 1)
        XCTAssertTrue(calcHelper.sendInput("2") == 12)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_RETURN) == nil)
        XCTAssertTrue(calcHelper.sendInput("3") == 3)
    }
    
    func testCalculation_2() {
        let calcHelper = CalculationHelper()
        
        XCTAssertTrue(calcHelper.sendInput("1") == 1)
        XCTAssertTrue(calcHelper.sendInput("2") == 12)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_ADD) == nil)
        XCTAssertTrue(calcHelper.sendInput("3") == 3)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_RETURN) == 15)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_ADD) == nil)
        XCTAssertTrue(calcHelper.sendInput("4") == 4)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_RETURN) == 19)
    }
    
    func testCalculation_3() {
        let calcHelper = CalculationHelper()
        
        XCTAssertTrue(calcHelper.sendInput("1") == 1)
        XCTAssertTrue(calcHelper.sendInput("2") == 12)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_ADD) == nil)
        XCTAssertTrue(calcHelper.sendInput("3") == 3)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_RETURN) == 15)
    }
    
    func testCalculation_4() {
        let calcHelper = CalculationHelper()
        
        XCTAssertTrue(calcHelper.sendInput("1") == 1)
        XCTAssertTrue(calcHelper.sendInput("2") == 12)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_ADD) == nil)
        XCTAssertTrue(calcHelper.sendInput("3") == 3)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_MULT) == 15)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_ADD) == nil)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_SUB) == nil)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_MULT) == nil)
    }
    
    func testCalculation_5() {
        let calcHelper = CalculationHelper()
        
        XCTAssertTrue(calcHelper.sendInput("1") == 1)
        XCTAssertTrue(calcHelper.sendInput("2") == 12)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_ADD) == nil)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_SUB) == nil)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_MULT) == nil)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_DIV) == nil)
        XCTAssertTrue(calcHelper.sendInput("3") == 3)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_RETURN) == 4)
    }
    
    func testCalculation_6() {
        let calcHelper = CalculationHelper()
        
        XCTAssertTrue(calcHelper.sendInput("1") == 1)
        XCTAssertTrue(calcHelper.sendInput("2") == 12)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_ADD) == nil)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_RETURN) == 24)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_RETURN) == nil)
    }
    
    func testCalculation_7() {
        let calcHelper = CalculationHelper()
        
        XCTAssertTrue(calcHelper.sendInput("2") == 2)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_ADD) == nil)
        XCTAssertTrue(calcHelper.sendInput("2") == 2)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_RETURN) == 4)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_RETURN) == 6)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_RETURN) == 8)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_RETURN) == 10)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_RETURN) == 12)
    }
    
    func testCalculation_8() {
        let calcHelper = CalculationHelper()
        
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_SUB) == nil)
        XCTAssertTrue(calcHelper.sendInput("5") == 5)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_ADD) == -5)
        XCTAssertTrue(calcHelper.sendInput("1") == 1)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_RETURN) == -4)
    }
    
    func testCalculation_9() {
        let calcHelper = CalculationHelper()
        
        XCTAssertTrue(calcHelper.sendInput("1") == 1)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_MULT) == nil)
        XCTAssertTrue(calcHelper.sendInput("2") == 2)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_ADD) == 2)
        XCTAssertTrue(calcHelper.sendInput("3") == 3)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_DIV) == 5)
        XCTAssertTrue(calcHelper.sendInput("2") == 2)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_SUB) == 2.5)
        XCTAssertTrue(calcHelper.sendInput("1") == 1)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_RETURN) == 1.5)
    }
    
    func testCalculation_10() {
        let calcHelper = CalculationHelper()
        
        XCTAssertTrue(calcHelper.sendInput("1") == 1)
        XCTAssertTrue(calcHelper.sendInput("1") == 11)
        XCTAssertTrue(calcHelper.sendInput("1") == 111)
        XCTAssertTrue(calcHelper.sendInput("1") == 1111)
        XCTAssertTrue(calcHelper.sendInput("1") == 11111)
        XCTAssertTrue(calcHelper.sendInput("1") == 111111)
        XCTAssertTrue(calcHelper.sendInput("1") == 1111111)
        XCTAssertTrue(calcHelper.sendInput("1") == 11111111)
        XCTAssertTrue(calcHelper.sendInput("1") == 111111111)
        XCTAssertTrue(calcHelper.sendInput("1") == 1111111111)
        XCTAssertTrue(calcHelper.sendInput("1") == 11111111111)
        XCTAssertTrue(calcHelper.sendInput("1") == 111111111111)
        XCTAssertTrue(calcHelper.sendInput("1") == 1111111111111)
        XCTAssertTrue(calcHelper.sendInput("1") == nil)
        XCTAssertTrue(calcHelper.sendInput("1") == nil)
    }
    
    func testCalculation_11() {
        let calcHelper = CalculationHelper()
        
        XCTAssertTrue(calcHelper.sendInput("1") == 1)
        XCTAssertTrue(calcHelper.sendInput(Const.MATH_ADD) == nil)
        XCTAssertTrue(calcHelper.sendInput("1") == 1)
        XCTAssertTrue(calcHelper.sendInput("1") == 11)
        XCTAssertTrue(calcHelper.sendInput("1") == 111)
        XCTAssertTrue(calcHelper.sendInput("1") == 1111)
        XCTAssertTrue(calcHelper.sendInput("1") == 11111)
        XCTAssertTrue(calcHelper.sendInput("1") == 111111)
        XCTAssertTrue(calcHelper.sendInput("1") == 1111111)
        XCTAssertTrue(calcHelper.sendInput("1") == 11111111)
        XCTAssertTrue(calcHelper.sendInput("1") == 111111111)
        XCTAssertTrue(calcHelper.sendInput("1") == 1111111111)
        XCTAssertTrue(calcHelper.sendInput("1") == 11111111111)
        XCTAssertTrue(calcHelper.sendInput("1") == 111111111111)
        XCTAssertTrue(calcHelper.sendInput("1") == 1111111111111)
        XCTAssertTrue(calcHelper.sendInput("1") == nil)
        XCTAssertTrue(calcHelper.sendInput("1") == nil)
    }
}

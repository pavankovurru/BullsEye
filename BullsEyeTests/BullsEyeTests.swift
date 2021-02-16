//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Pavan Kovurru on 1/8/21.
//

import XCTest
@testable import BullsEye

class BullsEyeTests: XCTestCase {
    
    var game: Game!

    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testScorePositive() throws {
        let userInput = game.target + 5
        let score = game.points(sliderValue: userInput)
        XCTAssertEqual(score, 95)
    }
    
    func testScorePnegative() throws {
        let userInput = game.target -  5
        let score = game.points(sliderValue: userInput)
        XCTAssertEqual(score, 95)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

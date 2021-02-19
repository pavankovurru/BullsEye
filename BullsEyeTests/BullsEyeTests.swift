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
    
    func testScoreNegative() throws {
        let userInput = game.target -  5
        let score = game.points(sliderValue: userInput)
        XCTAssertEqual(score, 95)
    }
    
    
    //MARK: BONUS POINTS TESTS
    func testScoreExact() throws {
        let userInput = game.target
        let score = game.points(sliderValue: userInput)
        XCTAssertEqual(score, 200)
    }
    
    func testScoreSlose() throws {
        let userInput = game.target - 2
        let score = game.points(sliderValue: userInput)
        XCTAssertEqual(score, 98 + 50)
    }
    
    
    //MARK: NEW ROUND TESTS
    func testNewRound(){
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score , 100)
        XCTAssertEqual(game.round , 2)
        
    }
    
    //MARK: RESTART TESTS
    func testrestart(){
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.score , 0)
        XCTAssertNotEqual(game.round , 1)
        game.restart()
        XCTAssertEqual(game.score , 0)
        XCTAssertEqual(game.round , 1)
        
        
    }
    
    
    
    
    
    //MARK: PERFORMANCE TESTS

    //    func testPerformanceExample() throws {
    //        // This is an example of a performance test case.
    //        measure {
    //            // Put the code you want to measure the time of here.
    //        }
    //    }

}

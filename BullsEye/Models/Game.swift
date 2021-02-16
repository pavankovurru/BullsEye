//
//  Game.swift
//  BullsEye
//
//  Created by Pavan Kovurru on 1/8/21.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    // 100 - (Guessed Value - Actual value)
    func points(sliderValue: Int) -> Int {
        let difference = abs(sliderValue - target)
        return 100 - difference
        
    }
}
       

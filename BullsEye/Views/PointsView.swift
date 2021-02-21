//
//  PointsView.swift
//  BullsEye
//
//  Created by pavan Kovurru on 2/18/21.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var alertIsDisplayed: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack(spacing: 10){
            InstructionText(text: "The Slider's Value Is ")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You Scored \(points) Points 🎉 🎉 🎉 ")
            Button(action: {
                withAnimation{
                    alertIsDisplayed = false
                }
                game.startNewRound(points: points)
            }) {
                ButtonText(text: "Start New Round")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(21.0)
        .shadow(color:.black, radius: 10, x: 5, y: 5)
        .transition(.scale)
        
    }
}

struct PointsView_Previews: PreviewProvider {
    
    static private var alertIsDisplayed = Binding.constant(false)
    static private var sliderValue = Binding.constant(40.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView(alertIsDisplayed: alertIsDisplayed, sliderValue: sliderValue, game: game)
        PointsView(alertIsDisplayed: alertIsDisplayed, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
        PointsView(alertIsDisplayed: alertIsDisplayed, sliderValue: sliderValue, game: game)
            .previewLayout(.fixed(width: 528, height: 360))
        PointsView(alertIsDisplayed: alertIsDisplayed, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 528, height: 360))
    }
}

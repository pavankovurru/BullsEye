//
//  ContentView.swift
//  BullsEye
//
//  Created by Pavan Kovurru on 1/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsDisplayed = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackGroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                SliderView(sliderValue: $sliderValue)
                ButtonView(alertIsDisplayed: $alertIsDisplayed, sliderValue: $sliderValue, game: $game)
            }
        }
    }
}



struct InstructionsView: View{
    @Binding var game: Game
    var body: some View{
        VStack{
            InstructionText(text: "🎯 🎯 🎯  PUT THE BULLS EYE AS CLOSE AS YOU CAN TO")
            BigNumberText(text: String(game.target))
        }
    }
}


struct SliderView: View{
    @Binding var sliderValue: Double
    var body: some View{
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}


struct ButtonView: View {
    
    @Binding var alertIsDisplayed: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            alertIsDisplayed.toggle()
        }) {
            Text("Hit Me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding()
        .background(ZStack {
            Color("ButtonColor")
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
        })
        .foregroundColor(Color.white)
        .cornerRadius(21)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
        
        .alert(isPresented: $alertIsDisplayed, content: {
            
            let roundedValue = Int(sliderValue.rounded())
            
            return Alert(title: Text("Title"), message: Text("The Slider's value is \(roundedValue).\n" + "You Scored \(game.points(sliderValue: roundedValue)) points this round"), dismissButton: .default(Text("Awesome")))
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .previewLayout(.fixed(width: 528, height: 360))
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 528, height: 360))
    }
}

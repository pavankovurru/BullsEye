//
//  PointsView.swift
//  BullsEye
//
//  Created by pavan Kovurru on 2/18/21.
//

import SwiftUI

struct PointsView: View {
    var body: some View {
        
        VStack(spacing: 10){
            InstructionText(text: "The Slider's Value Is ")
            BigNumberText(text: "89")
            BodyText(text: "You Scored 100 Points 🎉 🎉 🎉 ")
            Button(action: {}) {
                ButtonText(text: "Start New Round")
            }
            
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(21.0)
        .shadow(color:.black, radius: 10, x: 5, y: 5)
        
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView()
        PointsView()
            .preferredColorScheme(.dark)
        PointsView()
            .previewLayout(.fixed(width: 528, height: 360))
        PointsView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 528, height: 360))
    }
}

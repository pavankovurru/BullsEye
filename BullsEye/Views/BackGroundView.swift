//
//  BackGroundView.swift
//  BullsEye
//
//  Created by pavan Kovurru on 2/15/21.
//

import SwiftUI

struct BackGroundView: View {
    
    @Binding var game: Game
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            Color("BackgroundColor")
            .edgesIgnoringSafeArea(.all))
        
    }
}



struct TopView: View {
    
    @Binding var game: Game
    var body: some View {
        HStack{
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}


struct BottomView: View {
    
    @Binding var game: Game
    var body: some View {
        HStack{
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}



struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack{
            LabelText(text: title.uppercased())
            RoundedRectTextViewStroked(text: text)
        }
    }
}


struct BackGroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackGroundView(game: .constant(Game()))
        
    }
}

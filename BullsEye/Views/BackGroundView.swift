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
        .background(RingView())
    }
}



struct TopView: View {
    
    @Binding var game: Game
    var body: some View {
        HStack{
            Button(action: {
                game.restart()
            }) {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct RingView: View {
    
    //getting env property to know if user is in dark or light mode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            
            //background and color are in zstack
            
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
             
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [Color("RingColor").opacity(opacity * 0.8), Color("RingColor").opacity(0.0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300)
                    )
                    .frame(width: size, height: size)
            }
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
        BackGroundView(game: .constant(Game()))
            .colorScheme(.dark)
    }
}

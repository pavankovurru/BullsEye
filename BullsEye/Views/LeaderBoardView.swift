//
//  LeaderBoardView.swift
//  BullsEye
//
//  Created by pavan Kovurru on 3/29/21.
//

import SwiftUI

struct LeaderBoardView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack (spacing: 10){
                HeaderView()
                LabelView()
                RowView(index: 1, score: 1, date: Date())
            }
        }
    }
}

struct RowView: View {
    
    let index: Int
    let score: Int
    let date: Date
    
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.LeaderBoard.scoreColumnWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.LeaderBoard.dateColumnWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderBoardRowColor"),lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.LeaderBoard.maxRowWidth)
    }
}

struct HeaderView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    
    var body: some View{
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "LeaderBoard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "LeaderBoard")
                }
            }
            
            HStack{
                Spacer()
                Button(action: {}) {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
                
            }
        }
        
    }
}


struct LabelView: View {
    var body: some View{
        HStack {
            Spacer()
                .frame(width:Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width:Constants.LeaderBoard.scoreColumnWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width:Constants.LeaderBoard.dateColumnWidth)

        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.LeaderBoard.maxRowWidth)
        
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()            
        LeaderBoardView()
            .preferredColorScheme(.dark)
        LeaderBoardView()
            .previewLayout(.fixed(width: 528, height: 360))
        LeaderBoardView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 528, height: 360))
    }
}

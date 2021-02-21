//
//  RoundViews.swift
//  BullsEye
//
//  Created by pavan Kovurru on 2/15/21.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedRectViewWidth, height: Constants.General.roundedRectViewHeight)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokedColor"),lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedImageViewFilled: View {
    
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedRectViewWidth, height: Constants.General.roundedRectViewHeight)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor")))
    }
}

struct RoundedRectTextViewStroked: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.title3)
            .foregroundColor(Color("TextColor"))
            .kerning(-0.2)
            .frame(width: Constants.General.roundedRectViewWidth, height: Constants.General.roundedRectViewHeight)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                    .strokeBorder(Color("ButtonStrokedColor"),lineWidth: Constants.General.strokeWidth)
            )
    }
}



struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        
        HStack{
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundedRectTextViewStroked(text: "999")
        }
        
        HStack{
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")            .preferredColorScheme(.dark)
            RoundedImageViewFilled(systemName: "list.dash")            .preferredColorScheme(.dark)
            RoundedRectTextViewStroked(text: "999")
                .preferredColorScheme(.dark)

        }
    }
}

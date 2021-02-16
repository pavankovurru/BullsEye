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
            .frame(width: 56.0, height: 56.0)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokedColor"),lineWidth: 2.0)
            )
    }
}

struct RoundedImageViewFilled: View {
    
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56.0, height: 56.0)
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
            .frame(width: 68.0, height: 56.0)
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .strokeBorder(Color("ButtonStrokedColor"),lineWidth: 2.0)
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

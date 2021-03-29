//
//  TextViews.swift
//  BullsEye
//
//  Created by Pavan Kovurru on 2/15/21.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }

}


struct BigNumberText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .kerning(-1.0)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String
    var body: some View{
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .frame(width: 50.0)
    }
}

struct LabelText: View{
    var text: String
    var body: some View{
        Text(text)
            .bold()
            .font(.caption)
            .kerning(1.5)
            .foregroundColor(Color("TextColor"))
    }
}

struct BodyText: View{
    var text: String
    var body: some View{
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ButtonText: View{
    var text: String
    var body: some View{
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("AccentColor"))
            .cornerRadius(12.0)
            .foregroundColor(.white)
            .font(.body)
    }
}

struct ScoreText: View{
    var score: Int
    var body: some View{
        Text(String(score))
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
            
    }
}

struct DateText: View{
    var date: Date
    var body: some View{
        Text(date, style: .time)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions TEXT")
            BigNumberText(text: "999")
            SliderLabelText(text: "100")
            LabelText(text: "Round")
            BodyText(text: "You Scored 100 Points 🎉 🎉 🎉 ")
            ButtonText(text: "Start New Round")
            ScoreText(score: 90)
            DateText(date: Date())
        }
        .padding()
    }
}

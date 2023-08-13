//
//  CustomButtonTextView.swift
//  OnBoardingDailyRounds
//
//  Created by Jatin Kindra1 on 14/08/23.
//

import SwiftUI

struct CustomButtonTextView: View {
  var text: String
  var fontType: String
  var fontSize: Float
  var textColor: Color
  var paddingVertical: Float
  var paddingHorizontal: Float
  var cornerRadius: Float
  var borderColor: Color
  var borderLineWidth: Float
  var backgroundColor: Color
  
  var body: some View {
    Text(text)
      .font(.custom(fontType, size: CGFloat(fontSize)))
      .foregroundColor(textColor)
      .padding(.vertical, CGFloat(paddingVertical))
      .padding(.horizontal, CGFloat(paddingHorizontal))
      .overlay(
        RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
          .stroke(borderColor, lineWidth: CGFloat(borderLineWidth))
      )
      .background(backgroundColor)
  }
}

struct CustomButtonText_Previews: PreviewProvider {
  static var previews: some View {
    CustomButtonTextView(text: "Signup",
                         fontType: "Degular-Semibold",
                         fontSize: 22,
                         textColor: .black,
                         paddingVertical: 10,
                         paddingHorizontal: 42,
                         cornerRadius: 12,
                         borderColor: .black,
                         borderLineWidth: 2,
                         backgroundColor: Color(hex: "#FFFFFF"))
  }
}

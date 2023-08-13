//
//  CustomButtonTextViewWithImage.swift
//  OnBoardingDailyRounds
//
//  Created by Jatin Kindra1 on 14/08/23.
//

import SwiftUI

struct CustomButtonTextViewWithImage: View {
  var text: String
  var fontType: String
  var fontSize: Float
  var textColor: Color
  var paddingVertical: Float
  var paddingHorizontal: Float
  var cornerRadius: Float
  var borderColor: Color
  var borderLineWidth: Float
  var iconName: String
  
  var body: some View {
    Text("\(text) \(Image(systemName: iconName))")
      .font(.custom(fontType, size: CGFloat(fontSize)))
      .foregroundColor(textColor)
      .padding(.vertical, CGFloat(paddingVertical))
      .padding(.horizontal, CGFloat(paddingHorizontal))
      .overlay(
        RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
          .stroke(borderColor, lineWidth: CGFloat(borderLineWidth))
      )
  }
}

struct CustomButtonTextViewWithImage_Previews: PreviewProvider {
    static var previews: some View {
      CustomButtonTextViewWithImage(text: "Let's go",
                                    fontType: "Degular-Semibold",
                                    fontSize: 22,
                                    textColor: .black,
                                    paddingVertical: 10,
                                    paddingHorizontal: 42,
                                    cornerRadius: 12,
                                    borderColor: .black,
                                    borderLineWidth: 2,
                                    iconName: "arrow.forward")
    }
}

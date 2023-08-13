//
//  CustomFontTextView.swift
//  OnBoardingDailyRounds
//
//  Created by Jatin Kindra1 on 14/08/23.
//

import SwiftUI

struct CustomFontTextView: View {
  var text: String
  var fontType: String
  var fontSize: Float
  var body: some View {
    Text(text)
      .font(.custom(fontType, size: CGFloat(fontSize)))
  }
}

struct CustomFontTextView_Previews: PreviewProvider {
  static var previews: some View {
    CustomFontTextView(text: "MedBook", fontType: "Degular-Bold", fontSize: 32.0)
  }
}

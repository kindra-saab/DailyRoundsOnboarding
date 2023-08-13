//
//  LandingPage.swift
//  OnBoardingDailyRounds
//
//  Created by Jatin Kindra1 on 14/08/23.
//

import SwiftUI

struct LandingPage: View {
    var body: some View {
      NavigationView {
        VStack(spacing: 200) {
          VStack(alignment: .leading) {
            CustomFontTextView(text: "MedBook",
                               fontType: "Degular-Bold",
                               fontSize: 32)
            .padding(.leading)
            Image("landing")
              .resizable()
              .scaledToFit()
          }
          HStack {
            NavigationLink(
              destination: SignupScreen().toolbarRole(.editor),
              label: {
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
              })
            
            NavigationLink(
              destination: LoginScreen().toolbarRole(.editor),
              label: {
                CustomButtonTextView(text: "Login",
                                     fontType: "Degular-Semibold",
                                     fontSize: 22,
                                     textColor: .black,
                                     paddingVertical: 10,
                                     paddingHorizontal: 42,
                                     cornerRadius: 12,
                                     borderColor: .black,
                                     borderLineWidth: 2,
                                     backgroundColor: Color(hex: "#FFFFFF"))
              })
          }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(Color(hex: "#EEEEEE"))
      }.accentColor(.black)
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}

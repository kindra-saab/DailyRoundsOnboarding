//
//  LoggedInScreen.swift
//  OnBoardingDailyRounds
//
//  Created by Jatin Kindra1 on 13/08/23.
//

import SwiftUI

struct LoggedInScreen: View {
  
  @ObservedObject var viewModel: AuthenticationViewModel
  @Environment(\.presentationMode) var presentationMode
  
  
  var body: some View {
    VStack() {
      
      Text("\(Image(systemName: "book.fill")) MedBook")
        .padding(.leading)
        .font(.custom("Degular-Bold", size: 32))
        .frame(maxWidth: .infinity, alignment: .leading)
      
      CustomFontTextView(text: "Which topic interests you today?",
                         fontType: "Degular-Semibold",
                         fontSize: 28)
      .padding(.leading)
      .padding(.top, 50)
      .frame(maxWidth: .infinity, alignment: .leading)
      
      Spacer()
      
      Button(action: {
        viewModel.signOut()
      }) {
        CustomFontTextView(text: "Logout",
                           fontType: "Degular-Semibold",
                           fontSize: 18)
        .padding(.bottom, 40)
        .foregroundColor(.red)
      }
      .alert(isPresented: $viewModel.showSignoutAlert) {
        Alert(
          title: Text("Sign Out"),
          message: Text(viewModel.showSignoutMessage),
          dismissButton: .default(Text("okay")) {
            presentationMode.wrappedValue.dismiss()
          }
        )
      }
    }
    .background(Color(hex: "#FAFAFA"))
  }
}

struct LoggedInScreen_Previews: PreviewProvider {
  static var previews: some View {
    LoggedInScreen(viewModel: AuthenticationViewModel())
  }
}

//
//  SignupScreen.swift
//  OnBoardingDailyRounds
//
//  Created by Jatin Kindra1 on 09/08/23.
//

import SwiftUI

struct SignupScreen: View {
  
  @State private var email: String = ""
  @State private var password: String = ""
  @State private var isUserReadyToSignUp: Bool = false
  @State private var isLengthValid: Bool = false
  @State private var isUppercaseValid: Bool = false
  @State private var isSpecialCharValid: Bool = false
  @State private var isValidEmail: Bool = false
  
  @ObservedObject private var viewModel: AuthenticationViewModel = AuthenticationViewModel()
  
  private func validateUserSignupState() {
    isLengthValid = password.count >= 8
    isUppercaseValid = password.contains { $0.isUppercase }
    isSpecialCharValid = password.contains { "!@#$&*".contains($0) }
    isUserReadyToSignUp = isLengthValid && isUppercaseValid && isSpecialCharValid
  }
  
  private func isValidEmailFormat(_ email: String) {
    let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    isValidEmail = emailPredicate.evaluate(with: email)
  }
  
  var body: some View {
    VStack {
      if !viewModel.signedIn {
        VStack(alignment: .leading) {
          
          CustomFontTextView(text: "MedBook",
                             fontType: "Degular-Semibold",
                             fontSize: 32)
          .padding(.leading)
          
          CustomFontTextView(text: "Sign up to continue",
                             fontType: "Degular-Semibold",
                             fontSize: 32)
          .foregroundColor(Color(hex: "#585858"))
          .padding(.leading)
          
          TextField("Email", text: $email)
            .autocapitalization(.none)
            .padding(.vertical, 10)
            .keyboardType(.emailAddress)
            .overlay(Rectangle().frame(height: 2)
              .foregroundColor(.gray), alignment: .bottom)
            .padding()
            .onChange(of: email) { _ in
              isValidEmailFormat(email)
              validateUserSignupState()
            }
          
          SecureField("Password", text: $password)
            .padding(.bottom, 10)
            .overlay(Rectangle().frame(height: 2)
              .foregroundColor(.gray), alignment: .bottom)
            .padding()
            .onChange(of: password) { _ in
              validateUserSignupState()
            }
          
          VStack(alignment: .leading, spacing: 30) {
            CheckBoxView(title: "At least 8 characters", isChecked: $isLengthValid)
            CheckBoxView(title: "Contains an uppercase letter", isChecked: $isUppercaseValid)
            CheckBoxView(title: "Contains a special character", isChecked: $isSpecialCharValid)
          }
          .padding()
          
          CountryPicker(countriesInfo: viewModel.countriesDict,
                        fallBackCountries: viewModel.fallbackCountries)
          
          Spacer()
          
          Button(action: {
            print("button clicked")
            viewModel.signUp(email: email, password: password)
          }) {
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
            .background(isUserReadyToSignUp ? Color(hex: "#D3D3D3") : .white)
          }
          .disabled(!isUserReadyToSignUp)
          .alert(viewModel.errorMessage, isPresented: $viewModel.showAlert) {
            Button("Okay", role: .cancel) {}
          }
          .frame(maxWidth: .infinity, alignment: .center)
        }
        
        .padding()
        .background(
          Image("background_effect")
            .resizable()
            .scaledToFill()
            .position(x: 0, y: 0)
            .ignoresSafeArea()
        )
      }
      else {
        LoggedInScreen(viewModel: viewModel)
          .navigationBarHidden(true)
      }
    }
    .onAppear {
      viewModel.signedIn = viewModel.isSignedIn
      viewModel.fetchCountriesData()
    }
  }
}


struct CheckBoxView: View {
  var title: String
  @Binding var isChecked: Bool
  
  var body: some View {
    HStack {
      Image(systemName: isChecked ? "checkmark.square.fill" : "square")
        .resizable()
        .font(Font.title.weight(.bold))
        .frame(width: 20, height: 20)
      Text(title)
        .font(.custom("Degular-Bold", size: 18))
    }
  }
}

struct SignupScreen_Previews: PreviewProvider {
  static var previews: some View {
    SignupScreen()
  }
}

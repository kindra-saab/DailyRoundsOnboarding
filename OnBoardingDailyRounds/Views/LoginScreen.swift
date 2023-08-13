//
//  LoginScreen.swift
//  OnBoardingDailyRounds
//
//  Created by Jatin Kindra1 on 13/08/23.
//

import SwiftUI

struct LoginScreen: View {
  
  @State private var email: String = ""
  @State private var password: String = ""
  @State private var isPasswordLengthValid: Bool = false
  @State private var isUserReadyToLogin: Bool = false
  @State private var isValidEmail: Bool = false
  
  @ObservedObject private var viewModel: AuthenticationViewModel = AuthenticationViewModel()
  
  private func validateEmailAndPassword() {
    isPasswordLengthValid = password.count >= 8
    isUserReadyToLogin = isPasswordLengthValid
  }
  
  private func isValidEmailFormat(_ email: String) {
    let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    isValidEmail = emailPredicate.evaluate(with: email)
  }
  
  var body: some View {
    if !viewModel.signedIn {
      VStack(alignment: .leading) {
        
        CustomFontTextView(text: "Welcome",
                           fontType: "Degular-Semibold",
                           fontSize: 32)
        .padding(.leading)
        
        CustomFontTextView(text: "Log in to continue",
                           fontType: "Degular-Semibold",
                           fontSize: 32)
        .padding(.leading)
        .foregroundColor(Color(hex: "#585858"))
        
        TextField("Email", text: $email)
          .autocapitalization(.none)
          .padding(.vertical, 10)
          .keyboardType(.emailAddress)
          .overlay(Rectangle().frame(height: 2)
            .foregroundColor(.gray), alignment: .bottom)
          .padding()
          .onChange(of: email) { _ in
            isValidEmailFormat(email)
            validateEmailAndPassword()
          }
        
        SecureField("Password", text: $password)
          .padding(.bottom, 10)
          .overlay(Rectangle().frame(height: 2)
            .foregroundColor(.gray), alignment: .bottom)
          .padding()
          .onChange(of: password) { _ in
            validateEmailAndPassword()
          }
        
        Spacer()
        
        Button(action: {
          viewModel.signIn(email: email, password: password)
        }) {
          CustomButtonTextViewWithImage(text: "Login",
                                        fontType: "Degular-Semibold",
                                        fontSize: 22,
                                        textColor: .black,
                                        paddingVertical: 10,
                                        paddingHorizontal: 42,
                                        cornerRadius: 12,
                                        borderColor: .black,
                                        borderLineWidth: 2,
                                        iconName: "arrow.forward")
          .background(isUserReadyToLogin ? Color(hex: "#D3D3D3") : .white)
        }
        .disabled(!isUserReadyToLogin)
        .alert(viewModel.errorMessage, isPresented: $viewModel.showAlert) {
          Button("Okay", role: .cancel) {}
        }
        .frame(maxWidth: .infinity, alignment: .center)
      }
      .onAppear {
        viewModel.signedIn = viewModel.isSignedIn
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
}

struct LoginScreen_Previews: PreviewProvider {
  static var previews: some View {
    LoginScreen()
  }
}

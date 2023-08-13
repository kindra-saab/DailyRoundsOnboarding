//
//  AuthenticationViewModel.swift
//  OnBoardingDailyRounds
//
//  Created by Jatin Kindra1 on 13/08/23.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseAnalytics

final class AuthenticationViewModel: ObservableObject {
  
  @Published var signedIn = false
  @Published var errorMessage = ""
  @Published var showAlert = false
  @Published var countriesDict: [String: CountryInfo]? = nil
  @Published var showSignoutAlert = false
  
  /// In case API fails that fetches the list of countries, we are storing default values to 
  let fallbackCountries = ["India", "Australia", "Japan", "UAE", "USA"]
  var showSignoutMessage = "Signout Successfully"
  
  let auth = Auth.auth()
  
  var isSignedIn: Bool {
    return auth.currentUser != nil
  }
  
  /// Method to perform SignIn flow using Firebase.
  func signIn(email: String, password: String) {
    auth.signIn(withEmail: email,
                password: password) { result, error in
      
      if let error {
        /// changing published variables, so that view can update if we get error while logging in.
        self.errorMessage = error.localizedDescription
        self.showAlert = true
      }
      
      guard result != nil, error == nil else {
        return
      }
      
      //Success
      /// On successful login, changing 'signedIn' published variable to change the state of views.
      self.signedIn = true
    }
  }
  
  /// Method to perform signup flow using firebase.
  func signUp(email: String, password: String) {
    auth.createUser(withEmail: email,
                    password: password) { result, error in
      
      if let error {
        /// changing published variables, so that view can update if we get error while logging in.
        self.errorMessage = error.localizedDescription
        self.showAlert = true
      }
      
      guard result != nil, error == nil else {
        return
      }
      
      // Success
      /// On successful SignUp, changing 'signedIn' published variable to change the state of views.
      self.signedIn = true
    }
  }
  
  /// Method to perform signout using firebase.
  func signOut() {
    do {
      try auth.signOut()
      showSignoutAlert = true
    }
    catch let err {
      /// changing published variables, so that view can update if we get error while Signing Out.
      showSignoutMessage = err.localizedDescription
      showSignoutAlert = true
    }
  }
  
  /// API call to fetch the list of countries to show in picker view in SIGNUP SCREEN.
  func fetchCountriesData() {
    guard let url = URL(string: "https://api.first.org/data/v1/countries") else {
      return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      if let data = data {
        do {
          let decoder = JSONDecoder()
          let decodedData = try decoder.decode(CountriesResponse.self, from: data)
          DispatchQueue.main.async {
            self.countriesDict = decodedData.data
            print("countriesData is \(self.countriesDict)")
          }
        } catch {
          print(error)
        }
      }
    }.resume()
  }
}

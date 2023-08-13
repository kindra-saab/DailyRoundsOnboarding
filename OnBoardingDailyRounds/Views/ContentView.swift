//
//  ContentView.swift
//  OnBoardingDailyRounds
//
//  Created by Jatin Kindra1 on 09/08/23.
//

import SwiftUI

struct ContentView: View {
  
  @State private var showSignupView = false
  var body: some View {
    LandingPage()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

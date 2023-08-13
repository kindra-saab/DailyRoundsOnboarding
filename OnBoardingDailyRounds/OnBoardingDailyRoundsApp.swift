//
//  OnBoardingDailyRoundsApp.swift
//  OnBoardingDailyRounds
//
//  Created by Jatin Kindra1 on 09/08/23.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct OnBoardingDailyRoundsApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}

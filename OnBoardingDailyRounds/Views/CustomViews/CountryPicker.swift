//
//  CountryPicker.swift
//  OnBoardingDailyRounds
//
//  Created by Jatin Kindra1 on 13/08/23.
//

import SwiftUI

struct CountryPicker: View {
  @State private var selectedOption = 0
  var countriesInfo: [String: CountryInfo]?
  var fallBackCountries: [String]
  
  var body: some View {
    Picker("Select an option", selection: $selectedOption) {
      if let countriesDict = countriesInfo {
        ForEach(Array(countriesDict), id: \.key) { key, value in
          Text(value.country ?? "").tag(key)
        }
      }
      /// If API Fails to fetch the countries data, then we are showing default set of countries to user.
      else {
        ForEach(0..<self.fallBackCountries.count) { index in
          Text(self.fallBackCountries[index]).tag(index)
        }
      }
    }
    .frame(height: 140)
    .padding(0)
    .pickerStyle(WheelPickerStyle())
  }
}

struct CountryPicker_Previews: PreviewProvider {
  static var previews: some View {
    CountryPicker(fallBackCountries: ["india","australia","japan"])
  }
}

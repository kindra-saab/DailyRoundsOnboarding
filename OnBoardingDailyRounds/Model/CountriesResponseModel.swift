//
//  CountriesResponseModel.swift
//  OnBoardingDailyRounds
//
//  Created by Jatin Kindra1 on 13/08/23.
//

import Foundation

struct CountriesResponse: Codable {
  let status: String?
  let statusCode: Int?
  let version, access: String?
  let data: [String: CountryInfo]?
  
  enum CodingKeys: String, CodingKey {
    case status
    case statusCode = "status-code"
    case version, access, data
  }
}

// MARK: - Datum
struct CountryInfo: Codable {
  let country: String?
  let region: Region?
}

enum Region: String, Codable {
  case africa = "Africa"
  case antarctic = "Antarctic"
  case asia = "Asia"
  case centralAmerica = "Central America"
}

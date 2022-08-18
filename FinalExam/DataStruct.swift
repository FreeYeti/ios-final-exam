//
//  DataStruct.swift
//  FinalExam
//
//  Created by Jack on 2022/8/17.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let data = try? newJSONDecoder().decode(CovidData.self, from: jsonData)

// MARK: - Welcome
struct CovidData: Codable {
    let id, displayName: String
    let areas: [CovidData]
    let totalConfirmed: Int
    let totalDeaths, totalRecovered, totalRecoveredDelta, totalDeathsDelta: Int?
    let totalConfirmedDelta: Int?
    let lastUpdated: LastUpdated?
    let lat, long: Double?
    let parentID: String?

    enum CodingKeys: String, CodingKey {
        case id, displayName, areas, totalConfirmed, totalDeaths, totalRecovered, totalRecoveredDelta, totalDeathsDelta, totalConfirmedDelta, lastUpdated, lat, long
        case parentID = "parentId"
    }
}

enum LastUpdated: String, Codable {
    case the20200413T025727092Z = "2020-04-13T02:57:27.092Z"
}

//
//  City.swift
//  BBuBBi
//
//  Created by MinhyunCho on 6/10/25.
//

import Foundation

struct CityResponse: Codable {
    let response: CityWrapper
}

struct CityWrapper: Codable {
    let body: CityBody
}

struct CityBody: Codable {
    let items: CityItems
}

struct CityItems: Codable {
    let item: [City]
}

struct City: Identifiable, Codable {
    let citycode: Int
    let cityname: String

    var id: Int { citycode }
}

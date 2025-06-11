//
//  Station.swift
//  BBuBBi
//
//  Created by MinhyunCho on 6/8/25.
//

import Foundation

struct Station: Identifiable, Codable, Equatable {
    var id: String
    var name: String
}

struct BusArrivalPreview: Identifiable {
    let id = UUID()
    let routeNo: String
    let arrivalInMinutes: Int
    let stopsRemaining: Int
}

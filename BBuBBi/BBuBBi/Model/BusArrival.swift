//
//  BusArrival.swift
//  BBuBBi
//
//  Created by MinhyunCho on 6/8/25.
//

import Foundation

struct ArrivalResponse: Codable {
    let response: ArrivalOuterResponse
}

struct ArrivalOuterResponse: Codable {
    let header: ArrivalHeader
    let body: ArrivalBody
}

struct ArrivalHeader: Codable {
    let resultCode: String
    let resultMsg: String
}

struct ArrivalBody: Codable {
    let items: ArrivalItems?
    let numOfRows: Int
    let pageNo: Int
    let totalCount: Int
}

struct ArrivalItems: Codable {
    let item: [BusArrival]?
}

struct BusArrival: Identifiable, Codable {
    let arrprevstationcnt: Int
    let arrtime: Int
    let nodeid: String
    let nodenm: String
    let routeid: String
    let routeno: String
    let routetp: String
    let vehicletp: String

    var id: String { routeid + nodeid }
}

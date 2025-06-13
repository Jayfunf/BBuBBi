//
//  StationTabView.swift
//  BBuBBi
//
//  Created by MinhyunCho on 6/11/25.
//

import SwiftUI

struct StationTabView: View {
    @State private var selectedStation: Station? = nil

    var body: some View {
        let sampleBuses = [
            BusArrivalPreview(routeNo: "10-4", arrivalInMinutes: 10, stopsRemaining: 3),
            BusArrivalPreview(routeNo: "13-1", arrivalInMinutes: 13, stopsRemaining: 4),
            BusArrivalPreview(routeNo: "13-2", arrivalInMinutes: 16, stopsRemaining: 5),
            BusArrivalPreview(routeNo: "99-2", arrivalInMinutes: 5, stopsRemaining: 1),
            BusArrivalPreview(routeNo: "102", arrivalInMinutes: 12, stopsRemaining: 4),
            BusArrivalPreview(routeNo: "203", arrivalInMinutes: 13, stopsRemaining: 4),
            BusArrivalPreview(routeNo: "216", arrivalInMinutes: 4, stopsRemaining: 1),
            BusArrivalPreview(routeNo: "301", arrivalInMinutes: 3, stopsRemaining: 1),
            BusArrivalPreview(routeNo: "605", arrivalInMinutes: 5, stopsRemaining: 1),
            BusArrivalPreview(routeNo: "618", arrivalInMinutes: 36, stopsRemaining: 12),
            BusArrivalPreview(routeNo: "619", arrivalInMinutes: 5, stopsRemaining: 1),
            BusArrivalPreview(routeNo: "802", arrivalInMinutes: 7, stopsRemaining: 2)
        ]
        
        if let station = selectedStation {
            BusListView(station: station, buses: sampleBuses, onBack: {
                selectedStation = nil
            })
        } else {
            StationListView(onSelect: { station in
                selectedStation = station
            })
        }
    }
}

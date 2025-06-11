//
//  StationListView.swift
//  BBuBBi
//
//  Created by MinhyunCho on 6/11/25.
//

import SwiftUI

struct StationListView: View {
    let onSelect: (Station) -> Void

    let sampleStations: [Station] = [
        Station(id: "001", name: "월평역"),
        Station(id: "002", name: "월평중학교"),
        Station(id: "003", name: "갈마역"),
        Station(id: "004", name: "정부청사역"),
        Station(id: "005", name: "샘머리공원"),
        Station(id: "006", name: "가람아파트"),
        Station(id: "007", name: "오정농수산물시장"),
        Station(id: "008", name: "화정초등학교"),
        Station(id: "009", name: "중리지구대"),
    ]

    var body: some View {
        List(sampleStations) { station in
            Button {
                onSelect(station)
            } label: {
                Text(station.name)
                    .font(.system(size: 30, weight: .bold))
                    .padding(.vertical, 20)
            }
        }
    }
}

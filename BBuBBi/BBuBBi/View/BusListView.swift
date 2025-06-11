//
//  BusListView.swift
//  BBuBBi
//
//  Created by MinhyunCho on 6/11/25.
//

import SwiftUI

struct BusListView: View {
    let station: Station
    let buses: [BusArrivalPreview]
    let onBack: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(station.name)
                    .font(.system(size: 50, weight: .bold))
                    .padding(.leading)

                Spacer()

                Button(action: onBack) {
                    Image("back_button")
                        .resizable()
                        .frame(width: 80, height: 60)
                }
                .padding(.trailing)
            }
            .padding(.top, 20)
            .frame(height: 110)

            ScrollView {
                VStack(spacing: 16) {
                    ForEach(buses) { bus in
                        VStack(spacing: 8) {
                            Text(bus.routeNo)
                                .font(.system(size: 80, weight: .bold))
                                .foregroundColor(.black)

                            Text("\(bus.arrivalInMinutes)분 후 도착")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.orange)

                            Text("\(bus.stopsRemaining) 정거장 전")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
        }
        .background(Color.white)
    }
}

//
//  BusDetailView.swift
//  BBuBBi
//
//  Created by MinhyunCho on 6/12/25.
//

import SwiftUI

struct BusDetailView: View {
    let bus: BusArrivalPreview
    let stationName: String
    let onBack: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("정부청사역")
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

            // 버스 정보 카드
            VStack(spacing: 8) {
                Text(bus.routeNo)
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.black)

                Text("\(bus.arrivalInMinutes)분 후 도착")
                    .font(.title2)
                    .foregroundColor(.orange)

                Text("\(bus.stopsRemaining) 정거장 전")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            .cornerRadius(24)
            .padding(.horizontal)

            Spacer()

            // 하단 동그란 네비게이션 (예시로만 표시)
            HStack {
                Spacer()
                Image(systemName: "chevron.left.circle")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .foregroundColor(.gray)
                Spacer()
                Circle()
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: 36, height: 36)
                Spacer()
                Image(systemName: "chevron.right.circle")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.bottom, 24)
        }
        .navigationBarHidden(true)
    }
}

//
//  BusDetailView.swift
//  BBuBBi
//
//  Created by MinhyunCho on 6/12/25.
//

import SwiftUI
import Combine

struct BusDetailView: View {
    @State private var remainingSeconds: Int
    @State private var stopsRemaining: Int

    let bus: BusArrivalPreview
    let stationName: String
    let onBack: () -> Void

    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    init(bus: BusArrivalPreview, stationName: String, onBack: @escaping () -> Void) {
        self.bus = bus
        self.stationName = stationName
        self.onBack = onBack
        self._remainingSeconds = State(initialValue: 10)
        self._stopsRemaining = State(initialValue: bus.stopsRemaining)
    }

    var body: some View {
        VStack(spacing: 16) {
            // 상단 헤더
            HStack {
                Text(stationName)
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
            VStack(spacing: 16) {
                Text(bus.routeNo)
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(.black)
                
                if remainingSeconds <= 60 {
                    Text("\(remainingSeconds)초 후 도착")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.orange)
                } else if remainingSeconds > 60 {
                    Text("\(remainingSeconds / 60)분 후 도착")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.orange)
                } else if remainingSeconds == 0 {
                    Text("다음 버스를 탑승해 주세요.")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.orange)
                }

                Text("\(stopsRemaining) 정거장 전")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
            .background(Color(.systemGray6))
            .cornerRadius(20)

            Spacer()

            // 버스 위치 시각화
            VStack(spacing: 0) {
                GeometryReader { geo in
                    let imageWidth: CGFloat = 180
                        let screenWidth = geo.size.width

                        let progress = min(max(Double(remainingSeconds) / 50.0, 0), 1)

                        let maxOffset = -(screenWidth / 2 + imageWidth / 2)
                        let offsetX = CGFloat(progress) * maxOffset
                    HStack {
                        Spacer()
                        Image("bus_icon")
                            .resizable()
                            .frame(width: 180, height: 180)
                            .clipped()
                            .padding(.bottom, -200)
                            .offset(x: offsetX)
                            .animation(.easeInOut(duration: 0.4), value: offsetX)
                        Spacer()
                    }
                    
                }

                ZStack {
                    Image("load")
                        .resizable()
                        .frame(height: 26)
                        .clipped()

                    HStack {
                        Spacer()
                        Image("left_icon")
                            .resizable()
                            .frame(width: 49, height: 49)
                            .foregroundColor(.gray)
                        Spacer()
                        Image("center_icon")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.red)
                        Spacer()
                        Image("left_icon")
                            .resizable()
                            .frame(width: 49, height: 49)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
                .padding(.bottom, 50)
            }
        }
        .onReceive(timer) { _ in
            if remainingSeconds > 0 {
                remainingSeconds -= 1
            }
            
            stopsRemaining = remainingSeconds / 60
            
            if remainingSeconds < 60 {
                stopsRemaining = 0
            }
            
            if remainingSeconds < 30 {
                
            }
        }
        .navigationBarHidden(true)
    }
}

//
//  ContentView.swift
//  BBuBBi
//
//  Created by MinhyunCho on 6/5/25.
//

import SwiftUI

struct ContentView: View {
    enum Tab {
        case station, search
    }

    @State private var selectedTab: Tab = .station
    @State private var selectedStation: Station? = nil

    var body: some View {
        ZStack(alignment: .top) {
            // 콘텐츠 본문
            VStack(spacing: 0) {
                Spacer().frame(height: 60) // 상단 탭 영역만큼 띄움

                if selectedTab == .station {
                    StationTabView()
                } else {
                    SearchTabView()
                }
            }

            // 상단 탭 바 (SafeArea 보존)
            HStack(spacing: 0) {
                Button(action: {
                    selectedTab = .station
                }) {
                    HStack(spacing: 6) {
                        Image("location_mark")
                            .resizable()
                            .frame(width: 35, height: 35)
                        Text("정류장")
                            .font(.system(size: 30, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 80)
                    .background(selectedTab == .station ? Color.blue : Color.gray)
                }

                Button(action: {
                    selectedTab = .search
                }) {
                    HStack(spacing: 6) {
                        Image("directions_bus")
                            .resizable()
                            .frame(width: 35, height: 35)
                        Text("버스 검색")
                            .font(.system(size: 30, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 80)
                    .background(selectedTab == .search ? Color.blue : Color.gray)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 0))
            .shadow(color: .gray.opacity(0.2), radius: 1, y: 1)
        }
        .ignoresSafeArea(edges: .bottom) // 상단 SafeArea는 보존
    }
}

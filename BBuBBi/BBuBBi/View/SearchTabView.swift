//
//  SearchTabView.swift
//  BBuBBi
//
//  Created by MinhyunCho on 6/12/25.
//

import SwiftUI

struct SearchTabView: View {
    @State private var inputText: String = ""
    @State private var searchResults: [BusArrivalPreview] = []
    @State private var selectedBus: BusArrivalPreview? = nil
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(spacing: 20) {
            if let selected = selectedBus {
                BusDetailView(
                    bus: selected,
                    stationName: "광교중앙역",
                    onBack: { selectedBus = nil }
                )
            } else {
                searchSection
            }
        }
        .padding(.top, 30)
    }

    var searchSection: some View {
        VStack(spacing: 20) {
            HStack {
                TextField("버스 번호를 입력하세요", text: $inputText)
                    .font(.system(size: 20))
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .focused($isFocused)
                    .keyboardType(.numberPad)

                Button(action: {
                    isFocused = false
                    performSearch()
                }) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }

            if !inputText.isEmpty {
                Text("\(inputText)")
                    .font(.system(size: 80, weight: .bold))
            }

            if searchResults.isEmpty {
                Text("검색 결과가 없습니다")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
            } else {
                List(searchResults) { result in
                    Button {
                        selectedBus = result
                    } label: {
                        VStack(spacing: 16) {
                            Text(result.routeNo)
                                .font(.system(size: 80, weight: .bold))
                                .foregroundColor(.black)

                            Text("\(result.arrivalInMinutes)분 후 도착")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.orange)

                            Text("\(result.stopsRemaining) 정거장 전")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 16)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                    }
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                    
                }
                .listRowBackground(Color.white)
                .background(Color.white)
                .scrollContentBackground(.hidden)
            }
            Spacer()
        }
    }

    func performSearch() {
        let dummy = [
            BusArrivalPreview(routeNo: "10-4", arrivalInMinutes: 5, stopsRemaining: 2),
            BusArrivalPreview(routeNo: "10-4", arrivalInMinutes: 10, stopsRemaining: 5),
            BusArrivalPreview(routeNo: "10-4", arrivalInMinutes: 23, stopsRemaining: 11),
            BusArrivalPreview(routeNo: "99-2", arrivalInMinutes: 9, stopsRemaining: 3),
            BusArrivalPreview(routeNo: "42", arrivalInMinutes: 1, stopsRemaining: 1)
        ]

        searchResults = dummy.filter {
            $0.routeNo.contains(inputText)
        }
    }
}


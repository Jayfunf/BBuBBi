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
    @FocusState private var isFocused: Bool

    var body: some View {
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
            .padding(.horizontal)

            if searchResults.isEmpty {
                Text("검색 결과가 없습니다")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding(.top, 40)
            } else {
                List(searchResults) { result in
                    VStack(spacing: 8) {
                        Text(result.routeNo)
                            .font(.system(size: 32, weight: .bold))
                        Text("\(result.arrivalInMinutes)분 후 도착")
                            .font(.title3)
                            .foregroundColor(.orange)
                        Text("\(result.stopsRemaining) 정거장 전")
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                }
            }

            Spacer()
        }
        .padding(.top, 30)
    }

    // MARK: - 검색 로직 (더미)
    func performSearch() {
        let dummy = [
            BusArrivalPreview(routeNo: "10-4", arrivalInMinutes: 5, stopsRemaining: 2),
            BusArrivalPreview(routeNo: "99-2", arrivalInMinutes: 9, stopsRemaining: 3),
            BusArrivalPreview(routeNo: "42", arrivalInMinutes: 1, stopsRemaining: 1)
        ]

        searchResults = dummy.filter {
            $0.routeNo.contains(inputText)
        }
    }
}

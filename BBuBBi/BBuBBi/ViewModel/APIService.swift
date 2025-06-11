//
//  APIService.swift
//  BBuBBi
//
//  Created by MinhyunCho on 6/8/25.
//

import Foundation
import CoreLocation

class APIService: ObservableObject {
    private let serviceKey = "Cgj9lJVndZQMLjmUCCSmw4n6aJc0DM0xX4Qksu0lLyklm9aj%2B9lUAAN%2BQkaQ7DvgfTkrrF6ZVZ4RXr88APdv9A%3D%3D"

    // MARK: - 버스 정류장별 도착 정보 조회
func fetchArrivalInfo(cityCode: Int, nodeID: String, completion: @escaping ([BusArrival]) -> Void) {
        let urlString = "https://apis.data.go.kr/1613000/ArvlInfoInqireService/getSttnAcctoArvlPrearngeInfoList?serviceKey=\(serviceKey)&_type=json&cityCode=\(cityCode)&nodeid=\(nodeID)"

        guard let url = URL(string: urlString) else {
            print("❌ URL 생성 실패")
            completion([])
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("❌ API 호출 실패: \(error?.localizedDescription ?? "Unknown error")")
                completion([])
                return
            }

            do {
                let decoded = try JSONDecoder().decode(ArrivalResponse.self, from: data)
                completion(decoded.response.body.items?.item ?? [BusArrival(arrprevstationcnt: 0, arrtime: 0, nodeid: "", nodenm: "", routeid: "", routeno: "", routetp: "", vehicletp: "")])
            } catch {
                print("❌ JSON 디코딩 실패: \(error.localizedDescription)")
                completion([])
            }
        }.resume()
    }


    // MARK: - 도시 코드 목록 조회
    func fetchCityList(completion: @escaping ([City]) -> Void) {
        let urlString = "http://apis.data.go.kr/1613000/ArvlInfoInqireService/getCtyCodeList?serviceKey=\(serviceKey)&_type=json"
        
        guard let url = URL(string: urlString) else {
            print("❌ 도시코드 URL 생성 실패")
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("❌ 도시코드 API 호출 실패: \(error?.localizedDescription ?? "Unknown error")")
                completion([])
                return
            }

            do {
                let decoded = try JSONDecoder().decode(CityResponse.self, from: data)
                completion(decoded.response.body.items.item)
            } catch {
                print("❌ 도시코드 JSON 디코딩 실패: \(error.localizedDescription)")
                completion([])
            }
        }.resume()
    }
}

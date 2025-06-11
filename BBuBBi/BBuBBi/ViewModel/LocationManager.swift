//
//  LocationManager.swift
//  BBuBBi
//
//  Created by MinhyunCho on 6/8/25.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var currentLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.first?.coordinate {
            currentLocation = coordinate

            // ✅ x, y 좌표 콘솔 출력
            let x = coordinate.longitude
            let y = coordinate.latitude
            print("현재 위치 - x (경도): \(x), y (위도): \(y)")

            manager.stopUpdatingLocation() // 한 번만 가져오고 멈춤
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("❌ 위치 정보 가져오기 실패: \(error.localizedDescription)")
    }
}

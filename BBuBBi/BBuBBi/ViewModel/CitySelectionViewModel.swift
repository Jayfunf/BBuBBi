//
//  CitySelectionViewModel.swift
//  BBuBBi
//
//  Created by MinhyunCho on 6/10/25.
//

import Foundation

class CitySelectionViewModel: ObservableObject {
    @Published var cities: [City] = []
    @Published var selectedCityName: String = ""

    func loadCities() {
        APIService().fetchCityList { list in
            DispatchQueue.main.async {
                self.cities = list
                self.selectedCityName = list.first?.cityname ?? ""
            }
        }
    }
}

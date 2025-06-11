//
//  FavoriteManager.swift
//  BBuBBi
//
//  Created by MinhyunCho on 6/8/25.
//

import Foundation

class FavoriteManager: ObservableObject {
    @Published private(set) var favorites: Set<String> = []
    
    private let key = "favoriteStations"
    
    init() {
        loadFavorites()
    }
    
    func toggleFavorite(station: Station) {
        if favorites.contains(station.id) {
            favorites.remove(station.id)
        } else {
            favorites.insert(station.id)
        }
        saveFavorites()
    }
    
    func isFavorite(station: Station) -> Bool {
        favorites.contains(station.id)
    }
    
    private func loadFavorites() {
        if let saved = UserDefaults.standard.array(forKey: key) as? [String] {
            favorites = Set(saved)
        }
    }
    
    private func saveFavorites() {
        UserDefaults.standard.set(Array(favorites), forKey: key)
    }
}

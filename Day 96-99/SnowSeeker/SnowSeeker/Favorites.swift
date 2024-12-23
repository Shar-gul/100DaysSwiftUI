//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Tiago Valente on 18/11/2024.
//

import Foundation

@Observable
class Favorites {
    // the actual resorts the user has favorited
    private var resorts: Set<String>

    // the key we're using to read/write in UserDefaults
    private let key = "Favorites"

    init() {
        // load our saved data
        let tempResorts = UserDefaults.standard.object(forKey: key) as? [String] ?? []
        resorts = Set(tempResorts)
    }

    // returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    // adds the resort to our set and saves the change
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }

    // removes the resort from our set and saves the change
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }

    func save() {
        // write out our data
        let tempArray = Array(resorts)
        UserDefaults.standard.setValue(tempArray, forKey: key)
    }
}

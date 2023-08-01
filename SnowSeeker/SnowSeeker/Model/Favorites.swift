//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Berardino Chiarello on 01/08/23.
//

import Foundation

class Favorites: ObservableObject {
    
    private(set) var resorts: Set<String>
    
    static private let saveKey = "Favorites"
    private let saveUrl = FileManager.documentDirectory.appendingPathComponent(saveKey)
    
    init(){
        do{
           let data = try Data(contentsOf: saveUrl)
            resorts = try JSONDecoder().decode(Set<String>.self, from: data)
        } catch {
            resorts = []
        }
    }
    
    func saveData() {
        do{
            let data = try JSONEncoder().encode(resorts)
            try data.write(to: saveUrl, options: [.atomic, .completeFileProtection])
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort){
        objectWillChange.send()
        resorts.insert(resort.id)
        saveData()
    }
    
    func remove(_ resort: Resort){
        objectWillChange.send()
        resorts.remove(resort.id)
        saveData()
    }
    
}

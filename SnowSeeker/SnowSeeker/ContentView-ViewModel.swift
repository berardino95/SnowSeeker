//
//  ContentView-ViewModel.swift
//  SnowSeeker
//
//  Created by Berardino Chiarello on 26/07/23.
//

import Foundation

enum ResortFilter {
    case `default`,name, country
}

extension ContentView {
    
    @MainActor class ViewModel: ObservableObject {
        
        let resorts: [Resort] = Bundle.main.decode("resorts.json")
        
        @Published var filterIsShowed = false
        @Published var filterType = ResortFilter.name
        
        @Published var searchText = ""
        
        
        var sortedResorts : [Resort] {
            switch filterType {
            case .default:
                return resorts
            case .name:
                return resorts.sorted{ $0.name < $1.name }
            case .country:
                return resorts.sorted{ $0.country < $1.country }
            }
        }
        
        var filteredResorts : [Resort] {
            
            if searchText.isEmpty == false {
                return sortedResorts.filter{ $0.name.localizedCaseInsensitiveContains(searchText) }
            }
            
            return sortedResorts
        }
        
        //Test and finish filter logic
        
    }
}

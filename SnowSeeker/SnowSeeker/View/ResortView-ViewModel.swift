//
//  ResortView-ViewModel.swift
//  SnowSeeker
//
//  Created by Berardino Chiarello on 01/08/23.
//

import Foundation
extension ResortView{
    @MainActor class ViewModel : ObservableObject {
        
        @Published var selectedFacility : Facility?
        @Published var showingFacility = false
        
    }
}

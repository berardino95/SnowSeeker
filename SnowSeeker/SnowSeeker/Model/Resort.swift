//
//  Resort.swift
//  SnowSeeker
//
//  Created by Berardino Chiarello on 26/07/23.
//

import Foundation

struct Resort : Codable, Identifiable {
    let id : String
    let name : String
    let country : String
    let description : String
    let imageCredit : String
    let price : Int
    let size : Int
    let snowDepth : Int
    let elevation : Int
    let runs: Int
    let facilities: [String]
    
    
    var facilityType : [Facility] {
        //using map on facilities array passing Facility.init tell Xcode to take directly the string from facility and use it as name. In this case it work because in Facility we have only 2 property, but the id property has a value so the only property that is in the init is the name
        facilities.map(Facility.init)
    }
    
    //Loading all resorts to using them in SwiftUI to create the UI
    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    
    static let resortExample = allResorts[0]
    
}

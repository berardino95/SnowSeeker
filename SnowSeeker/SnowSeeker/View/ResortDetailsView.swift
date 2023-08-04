//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Berardino Chiarello on 27/07/23.
//

import SwiftUI

struct ResortDetailsView: View {
    
    let resort: Resort
    
    var size: String {
        switch resort.size {
        case 1:
            return "Small"
        case 2:
            return "Average"
        default:
            return "Large"
        }
    }
    
    var price: String {
        String(repeating: "$", count: resort.price)
    }
    
    var body: some View {
        Group{
            VStack(spacing: 3){
                Text("Size")
                    .font(.caption.bold())
                    .opacity(0.5)
                Text(size)
                    .font(.title3)
            }
            
            VStack(spacing: 3){
                Text("Price")
                    .font(.caption.bold())
                    .opacity(0.5)
                Text(price)
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct ResortDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ResortDetailsView(resort: Resort.resortExample)
    }
}

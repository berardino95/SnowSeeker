//
//  SkiDetailsView.swift
//  SnowSeeker
//
//  Created by Berardino Chiarello on 27/07/23.
//

import SwiftUI

struct SkiDetailsView: View {
    let resort: Resort
    
    var body: some View {
        //Using group as container let us to choose ho to show this 2 VStack directly on the parent View, if we put the View in a HStack we could se the 2 VStack aligned horizontally, with a VStack we could see the 2 VStack aligned vertically
        Group{
            VStack(spacing: 3){
                Text("Elevation")
                    .font(.caption.bold())
                    .opacity(0.5)
                Text("\(resort.elevation)m")
                    .font(.title3)
            }
            
            VStack(spacing: 3){
                Text("Snow")
                    .font(.caption.bold())
                    .opacity(0.5)
                Text("\(resort.snowDepth)cm")
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetailsView(resort: Resort.resortExample)
    }
}

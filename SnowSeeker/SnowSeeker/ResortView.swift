//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Berardino Chiarello on 27/07/23.
//

import SwiftUI

struct ResortView: View {
    
    let resort : Resort
    
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dynamicTypeSize) var typeSize
    @EnvironmentObject var favorites: Favorites
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0){
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                    .overlay(alignment: .bottomTrailing){
                        Text("© " + resort.imageCredit)
                            .font(.caption)
                            .foregroundColor(.black).opacity(0.6)
                            .padding(5)
                    }
                
                //Changing the layout based on sizeClass and dynamicType
                HStack{
                    if sizeClass == .compact && typeSize > .large {
                        VStack(spacing: 10){ ResortDetailsView(resort: resort) }
                        VStack(spacing: 10){ SkiDetailsView(resort: resort) }
                    } else  {
                        ResortDetailsView(resort: resort)
                        SkiDetailsView(resort: resort)
                    }
                }
                .dynamicTypeSize(...DynamicTypeSize.xLarge)
                .padding(.vertical)
                .background(Color.primary.opacity(0.05))
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(resort.description)
                        .padding(.bottom)
                    
                    Text("Facilities")
                        .font(.headline)
                    
                    HStack(spacing: 30){
                        ForEach(resort.facilityType) { facility  in
                            VStack(spacing: 5){
                                Button {
                                    vm.selectedFacility = facility
                                    vm.showingFacility = true
                                } label: {
                                    facility.icon
                                        .font(.title)
                                }
                                
                                Text(facility.name)
                                    .font(.caption)
                                    .opacity(0.9)
                                    .multilineTextAlignment(.center)
                                
                            }
                        }
                    }
                    .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                    
                    Spacer().frame(height: 15)
                    
                    Button {
                        if favorites.contains(resort) {
                            favorites.remove(resort)
                        } else {
                            favorites.add(resort)
                        }
                    } label: {
                        Text(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal, 50)
                    
                }
                .padding()
            }
            .navigationTitle("\(resort.name), \(resort.country)")
            .navigationBarTitleDisplayMode(.inline)
            .alert(vm.selectedFacility?.name ?? "More information", isPresented: $vm.showingFacility, presenting: vm.selectedFacility) { _ in
            } message: { facility in
                Text(facility.description)
                
            }
        }
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ResortView(resort: Resort.resortExample)
        }
        .environmentObject(Favorites())
    }
}

//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Berardino Chiarello on 25/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    @StateObject var favorites = Favorites()
    
    var body: some View {
        NavigationView {
            
            //Primary view when use the app on big device like ipad or landscape mode on iphone max
            List (vm.filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack{
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .shadow(radius: 1.5).drawingGroup()
                            .padding(.trailing)
                        
                        VStack(alignment: .leading){
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                        
                    }
                }
                //aligning the row separator to the flag
                .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                    return 0
                }
            }
            .searchable(text: $vm.searchText, prompt: "Search for a resort")
            .toolbar{
                Button{
                    vm.filterIsShowed = true
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                }
                .accessibilityLabel("Select how to filter resorts")
            }
            .confirmationDialog("Filter you resorts by", isPresented: $vm.filterIsShowed){
                Button ("Default") { vm.filterType = .default }
                Button ("Name (A-z)") { vm.filterType = .name }
                Button ("Country (A-Z)") { vm.filterType = .country }
            }
            .navigationTitle("Resorts")
            
            //Secondary view shows automatically on first launch of the app
            WelcomeView()
        }
        .environmentObject(favorites)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

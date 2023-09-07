//
//  ContentView.swift
//  Buskers
//
//  Created by I3LT-020 on 5/9/23.
//

import SwiftUI


struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var buskerManager = BuskerManager()
    @State var buskers: [Busker]?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                
                if let buskers = buskers {
                    SwipeView(buskers: buskers)
                    
                } else {
                    LoadingView()
                        .onAppear {
                            buskers = buskerManager.getFilteredBuskersList(userLatitude: location.latitude, userLongitude: location.longitude)
                        }
                }
                
                
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    LandingPageView()
                        .environmentObject(locationManager)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

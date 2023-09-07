//
//  LandingPageView.swift
//  Buskers
//
//  Created by I3LT-020 on 7/9/23.
//

import SwiftUI
import CoreLocationUI

struct LandingPageView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack{
            
            VStack(spacing:20) {
                Text("Welcome to buskers")
                    .bold()
                    .font(.title)
                
                Text("Share your location")
            }
            .multilineTextAlignment(.center)
            .padding()
            
            // LocationButton from CoreLocationUI framework imported above, allows us to requestionLocation
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}

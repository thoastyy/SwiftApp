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
    @State private var isAnimating = false
    
    var body: some View {
        
        
        VStack{
            
            VStack(spacing:20) {
                
                VStack{
                    Text("BUSKERS")
                        .font(.system(size: 55, weight: .bold))
                        .overlay(
                            Text("BUSKERS")
                                .font(.system(size: 55, weight: .bold))
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.blue, .purple, .blue]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .mask(
                                    Text("BUSKERS")
                                        .font(.system(size: 55, weight: .bold))
                                        .foregroundColor(.clear)
                                        .background(
                                            LinearGradient(
                                                gradient: Gradient(colors: [.clear, .white, .clear]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                            .offset(x: isAnimating ? 200 : -200)
                                        )
                                )
                                .onAppear {
                                    withAnimation(Animation.linear(duration: 7).repeatForever(autoreverses: false)) {
                                        self.isAnimating.toggle()
                                    }
                                }
                        )
                    
                }
                
                
                
                //                Text("Welcome to buskers")
                //                    .bold()
                //                    .font(.title)
                
                Text("Discover buskers near you!")
                    .italic()
                    .font(.system(size: 16))
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
        //        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}

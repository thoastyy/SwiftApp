//
//  AnimationView.swift
// Animation for LaunchView
//
//  Created by user on 7/9/23.
//

import SwiftUI

struct AnimationView: View {
    @State private var isAnimating = false
    
    var body: some View {
        VStack{
            Text("BUSKERS")
                .font(.system(size: 50, weight: .bold))
                .overlay(
                    Text("BUSKERS")
                        .font(.system(size: 50, weight: .bold))
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [.blue, .purple, .blue]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .mask(
                            Text("BUSKERS")
                                .font(.system(size: 50, weight: .bold))
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
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}

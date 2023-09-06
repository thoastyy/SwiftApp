//
//  ContentView.swift
//  Navigation for the three buskers
//
//  Created by user on 6/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentIndex = 0
    //array for the buskers' view
    let views: [AnyView] = [
        AnyView(Busker1View()),
        AnyView(Busker2View()),
        AnyView(Busker3View())
    ]
    
    var body: some View {
        VStack {
            Spacer()
            
            FullScreenPageView(content: views[currentIndex])
                .transition(.slide)
            
            Spacer()
            
            HStack {
                Button(action: {
                    self.currentIndex = max(self.currentIndex - 1, 0)
                }) {
                    Image(systemName: "arrow.left.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(currentIndex > 0 ? .yellow : Color.yellow.opacity(0.3))
                }
                
                Spacer()
                
                Button(action: {
                    self.currentIndex = min(self.currentIndex + 1, self.views.count - 1)
                }) {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(currentIndex < views.count - 1 ? .yellow : Color.yellow.opacity(0.3))
                }
            }
            .padding()
        }
    }
}

struct FullScreenPageView<Content: View>: View {
    let content: Content
    
    var body: some View {
        ZStack {
 
            
            content
                .foregroundColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


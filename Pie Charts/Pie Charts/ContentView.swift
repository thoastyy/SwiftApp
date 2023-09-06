//
//  ContentView.swift
//  Pie Charts
//
//  Created by I3LT-040 on 6/9/23.
//

import SwiftUI


struct ContentView: View {
    @State private var pie = PieChartV2()

    var body: some View {
        ZStack {
        pie.chart(
            PlottableValue(name: "Rock", value: 90, color: .blue), // This is variadic call
            PlottableValue(name: "Indie", value: 10, color: .pink),
            PlottableValue(name: "Pop", value: 80, color: .mint)
        )
        .frame(height: 250)
            // Overlay a circular picture
            Image("CirclePicture") // Replace with your image asset name
                .resizable()
                .frame(width: 175, height: 175)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 0))
                .offset(x: 0, y: -250) // Adjust the offset as needed
        
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

////
////  PieChartBeta.swift
////  Pie Charts
////
////  Created by I3LT-040 on 6/9/23.
////
//
//import SwiftUI
//import Charts
//

//
//
//
//#Preview {
//    PieChartBeta()
//}


import SwiftUI
import Charts



@available(macOS 14.0, *)
struct PieChartExampleView: View {
    let data = [
        (name: "Pop", count: 1),
        (name: "Rock", count: 2),
        (name: "Indie", count: 3),
        (name: "Jazz", count: 4),
        (name: "Hip-Hop", count: 5),
        (name: "R&B", count: 6),
    ]

        var body: some View {
            VStack{
                Text("Steve Jobs").font(.title2).bold()// FOR CHANGING NAME
                ZStack{
                    Chart(data, id: \.name) { name, count in
                        SectorMark(angle: .value("Value", count), innerRadius: .ratio(0.8), angularInset: 1.5)
                        .cornerRadius(5)
                        .foregroundStyle(by: .value("Genre", name))
                    }
                    
//                    .foregroundStyle( // Gradient shading
//                        LinearGradient(
//                            colors: [ .orange,.yellow],
//                            startPoint: .leading,
//                            endPoint: .trailing
//                        )
//                    )
                    .frame(height: 300)
                    
                        Image("CirclePicture") // Replace with your image asset name
                            .resizable()
                            .frame(width: 220, height: 220)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 0))
                            .offset(x:0,y:-9)
                }
            }
        .offset(x:0,y:-215)// FOR CHANGING CIRCLE COORD
    }
}

@available(macOS 14.0, *)
#Preview {
    PieChartExampleView()
}

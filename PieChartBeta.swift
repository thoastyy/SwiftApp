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
        (name: "Pop", count: 6, color: Color(red: 0.8, green: 0.5, blue: 0, opacity: 0.5)),
        (name: "Rock", count: 2, color: Color(red: 0.7, green: 0.4, blue: 0, opacity: 1)),
        (name: "Indie", count: 3, color: Color(red: 0.6, green: 0.3, blue: 0, opacity: 1)),
        (name: "Jazz", count: 4, color: Color(red: 0.5, green: 0.2, blue: 0, opacity: 1)),
        (name: "Hip-Hop", count: 5, color: Color(red: 0.4, green: 0.1, blue: 0, opacity: 1)),
        (name: "R&B", count: 7, color: Color(red: 0.3, green: 0, blue: 0, opacity: 1)),
    ]

        var body: some View {
            VStack{
                Text("Steve Jobs")
                    .font(
                        .title2
                    )
                    .bold()// FOR CHANGING NAME
                ZStack{
                    Chart(data, id: \.name) { name, count, color in
                        SectorMark(angle: .value("Value", count),
                                   innerRadius: .ratio(0.8),
                                   angularInset: 1.5)
                        .cornerRadius(5)
                        .foregroundStyle(color)
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
                            .frame(width: 234, height: 234)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 0))

                }
                Spacer()
            }
    }
}

@available(macOS 14.0, *)
#Preview {
    PieChartExampleView()
}

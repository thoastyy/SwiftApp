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

    let catData = SongGenre.catExamples
    let dogData = SongGenre.dogExamples
//    let genreData = SongGenre.genreExamples
    
    var catTotal: Double {
        catData.reduce(0) { $0 + $1.population }
    }
    
    var dogTotal: Double {
        dogData.reduce(0) { $0 + $1.population }
    }    
//    var genreTotal: Double {
//        MusicGenre.reduce(0) { $0 + $1.population }
//    }
    var data: [(type: String, amount: Double)] {
        [(type: "cat", amount: catTotal),
         (type: "dog", amount: dogTotal)
//         (type: "Pop", amount: PopTotal),
//         (type: "Rock", amount: RockTotal),
//         (type: "Indie", amount: IndieTotal)
        ]
    }
    
    var maxPet: String? {
        data.max { $0.amount < $1.amount }?.type
    }

        var body: some View {
            VStack{
                Text("Steve Jobs").font(.title2).bold()// FOR CHANGING NAME
                ZStack{
                    Chart(data, id: \.type) { dataItem in
                        SectorMark(angle: .value("Type", dataItem.amount),
                                   innerRadius: .ratio(0.8),
                                   angularInset: 1.5)
                        .cornerRadius(5)
                        .opacity(dataItem.type == maxPet ? 1 : 0.5)
                        
                    }
                    .frame(height: 300)
                    .accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                    
                        Image("CirclePicture") // Replace with your image asset name
                            .resizable()
                            .frame(width: 234, height: 234)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 0))
                }
            }
        .offset(x:0,y:-215)// FOR CHANGING CIRCLE COORD
    }
}

@available(macOS 14.0, *)
#Preview {
    PieChartExampleView()
}

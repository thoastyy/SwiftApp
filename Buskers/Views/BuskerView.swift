//
//  BuskerView.swift
//  Buskers
//
//  Created by I3LT-020 on 7/9/23.
//

import SwiftUI

struct BuskerView: View {
    let buskerObj: Busker
    
    var body: some View {
        
        VStack{
            NameCardView(buskerObj: buskerObj)
            Text("Songs Played")
                .padding(.top).bold()
                .font(.system(size: 25))
            carouselView(buskerObj: buskerObj)

        }
    }
}

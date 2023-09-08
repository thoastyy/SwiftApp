//
//  SwipeView.swift
//  Buskers
//
//  Created by I3LT-020 on 7/9/23.
//

import SwiftUI

struct SwipeView: View {
    var buskers: [Busker]
    @State private var currentIndex = 0

    
    var body: some View {
        TabView{
            ForEach(buskers) { busker in
//                Text(busker.name)
                BuskerView(buskerObj: busker)
            }
        }
        .tabViewStyle(.page)
        
    }
}

//struct xSwipeView: View {
//    @State private var currentIndex = 0
//    let views: [AnyView] = [
//        AnyView(BuskerView()),
//        AnyView(busker2View()),
//        AnyView(busker3View())
//    ]
//
//    var body: some View {
//        VStack {
//            testSwipe()
//        }
//    }
//}
//struct testSwipe: View {
//    var body: some View {
//        TabView{
//            busker1View()
//            busker2View()
//            busker3View()
//        }
//        .tabViewStyle(.page)
//    }
//}

//struct FullScreenPageView<Content: View>: View {
//    let content: Content
//    
//    var body: some View {
//        ZStack {
//            content
//                .foregroundColor(.black)
//        }
//    }
//}



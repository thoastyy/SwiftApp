//
//  ProgressView.swift
//  Buskers
//
//  Created by I3LT-020 on 7/9/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        
        ZStack{
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Text("Gathering buskers!! 😆")
                .offset(y:50)
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}



import SwiftUI


struct carouselView: View {
    let buskerObj: Busker
    
//    let songName: String
    
    var body: some View {
        VStack{
//            HStack{
//                Text(songName)
//            }
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 16) {
//                    ForEach(songData){ i in
                    ForEach(buskerObj.songs){ i in
                        GeometryReader{
                            proxy in
                            let scale = getScale(proxy: proxy)
                            VStack(spacing: 30){
                                AsyncImage(url: URL(string: i.imageURL)) { image in
                                   image
                                        .resizable()
                                        .scaledToFit()
                                        .scaleEffect(.init(width: scale, height: scale)) // Apply the scaling effect here
//                                        .animation(.easeIn(duration: 3)) // Add ease-in animation
                               } placeholder: {
                                   ProgressView()
                               }
                                
//
//                                Image(uiImage: i.imageURL.load())
//                                    .resizable()
//                                    .scaledToFit()
//                                    .scaleEffect(.init(width: scale, height: scale)) // Apply the scaling effect here
//                                    .animation(.easeIn(duration: 3)) // Add ease-in animation
                                Text(i.artist)
                                    .font(.system(size: 16))
                            }
                            .scaleEffect(.init(width: scale, height: scale))
                            .padding(.vertical)
                            
                        }//end geometry
                        .frame(width: 180, height: 240)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 3)
                    }
                }
            }
            
            
        }//end vstack
        
       
    }
    
    func getScale(proxy: GeometryProxy) -> CGFloat{
        let midPoint: CGFloat = 260
        let viewFrame = proxy.frame(in: CoordinateSpace.global)
        
        var scale: CGFloat = 1.0
        let threshold: CGFloat = 100

        
        let diffFromCenter = abs(midPoint - viewFrame.midX)
        if diffFromCenter < threshold {
                // Scale up the image in the middle
                scale = 1.2 // You can adjust this value to make it bigger or smaller
            }
        
        return scale
    }
}


import SwiftUI

struct NameCardView: View {
    @State private var counter:Int=0
    @State private var isTapped = false
    let buskerObj: Busker
    
    var body: some View {
        VStack{
            ZStack{
                PieChartBeta()
                AsyncImage(url: URL(string: buskerObj.profilePicture)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    //                    .scaledToFit()
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                        .opacity(counter == 0 ? 1 : 0)
                        .onTapGesture {
                            counter += 1
                            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
                                counter -= 1
                            }
//                            if counter == 0 {
//                                counter += 1
//                            } else {
//                                counter -= 1
//                            }
                        }
                }
            placeholder: {
                    ProgressView()
                
                }
            }
            
            Text(buskerObj.name)
                .bold()
                .font(.system(size: 36))
            HStack(spacing: 30){
                BioView(buskerObj: buskerObj)
                musicPlayer()
            }
            
        }
    }
}


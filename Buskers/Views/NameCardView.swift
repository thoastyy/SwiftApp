
import SwiftUI

struct NameCardView: View {
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
                }placeholder: {
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



import SwiftUI

struct NameCardView: View {
    let buskerObj: Busker
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: buskerObj.profilePicture)) { image in
               image
                   .resizable()
                   .aspectRatio(contentMode: .fit)
           } placeholder: {
               ProgressView()
           }
//            Image(UIImageView.imageFromServerURL(URLString:buskerObj.profilePicture, placeHolder:nil ))
//                .resizable()
//                .aspectRatio(contentMode: .fit) // Maintain aspect ratio and fit within the frame
//                .frame(width: 300, height: 225) // Set the desired width and height
//                .clipShape(Circle())
                
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



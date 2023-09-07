import SwiftUI
import Charts



@available(macOS 14.0, *)

struct PlottableValue: Identifiable {
    var id = UUID()
    var name: String
    var value: Double
    var color: Color
}

struct PieChartBeta: View {
    let colors: [Color] = [.gray, .red, .orange, .yellow,
                           .green, .blue, .purple, .pink]
    
    
    @State private var fgColor: Color = .gray
    @State private var imageString: String = "CirclePicture"
    
//    @State private var counter:Int=0
    
    let data = [
        (name: "Pop", count: 70, color: Color(.green)),
        (name: "Rock", count: 2, color: Color(.yellow)),
        (name: "Indie", count: 3, color: Color(.orange)),
        (name: "Jazz", count: 4, color: Color(.red)),
        (name: "Hip-Hop", count: 5, color: Color(.purple)),
        (name: "R&B", count: 7, color: Color(.blue)),
    ]
        var body: some View {
//            VStack{
//                Text("Steve Jobs")
//                    .font(
//                        .title2
//                    )
//                    .bold()// FOR CHANGING NAME

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
                    .frame(height: 320)
                    
                    GenreCalc()
                    
                        Image(imageString) // Replace with your image asset name
                            .resizable()
                            .frame(width: 234, height: 234)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 0))
                            .foregroundColor(fgColor)
                            .contentShape(Circle()) // Set the content shape to Circle
//                            .onTapGesture(count: 1) {
////                                fgColor = colors.randomElement()!
//                                if counter==0{
//                                    imageString = ""
//                                    counter+=1
//                                }else{
//                                    imageString = "CirclePicture"
//                                    counter-=1
//                                }
//                            }       //[For Hiding Legend on tap]
//                }
                Spacer()
//                Image(systemName: "pencil.circle.fill")
//                    .resizable()
//                    .frame(width: 200, height: 200)
//                    .foregroundColor(fgColor)
//                    .contentShape(Circle()) // Set the content shape to Circle
//                    .onTapGesture(count: 1) {
//                        fgColor = colors.randomElement()!
//                    }
            }
    }
}

@available(macOS 14.0, *)
#Preview {
    PieChartBeta()
}


struct PieChartBeta_Previews: PreviewProvider {
    static var previews: some View {
        PieChartBeta()
    }
}

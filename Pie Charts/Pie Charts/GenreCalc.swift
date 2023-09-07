import SwiftUI

struct GenreDataMod: View {
    var body: some View {
        let data = [
            Genre(name: "Pop", count: 6, color: Color(.green)),
            Genre(name: "Rock", count: 2, color: Color(.yellow)),
            Genre(name: "Indie", count: 3, color: Color(.orange)),
            Genre(name: "Jazz", count: 4, color: Color(.red)),
            Genre(name: "Hip-Hop", count: 5, color: Color(.purple)),
            Genre(name: "R&B", count: 7, color: Color(.blue))
        ]
        GenreCalc(data:data)
    }
}
struct Genre {
    var name: String
    var count: Int
    var color: Color
}

struct GenreCalc: View {
    @State var data:Array<Genre>=[]

    var body: some View {
        ZStack{
            Circle()
                .foregroundColor(.white)
            VStack(alignment: .leading) {
                let data = data.sorted {
                    $0.count > $1.count
                }
                
                ForEach(data, id: \.name) { item in
                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundStyle(item.color)
                        Text("\(item.name)").bold()
                            .foregroundColor(.black)
                        Spacer()
                        Text("\(item.count)%")
                    }
                }
            }
            .padding(.horizontal, 40)
        }
        .frame(width: 234, height: 234)
    }
}
struct GenreCalc_Previews: PreviewProvider {
    static var previews: some View {
        GenreDataMod()
    }
}
//#Preview {
//    GenreDataMod()
//}

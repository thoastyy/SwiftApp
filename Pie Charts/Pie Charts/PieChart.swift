//
//  PieChart.swift
//  Pie Charts
//
//  Created by I3LT-040 on 6/9/23.
//


import SwiftUI

struct PlottableValue: Identifiable {
    var id = UUID()
    var name: String
    var value: Double
    var color: Color
}

class PieChart {
    // where to position the legend
    enum Legend {
        case top, bottom, leading, trailing, hidden
    }

    //draw an segment of the pie chart
    private struct PieSegment: Shape, Identifiable {
        var data: PlottableValue
        var id: UUID { data.id }
        var startAngle: Double
        var amount: Double

        func path(in rect: CGRect) -> Path {
            let radius = min(rect.width, rect.height) * 0.50
            let center = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)

            var path = Path()
            path.move(to: center)
            path.addRelativeArc(center: center, radius: radius, startAngle: Angle(radians: startAngle), delta: Angle(radians: amount))
            return path
            
        
        }
    }

    /// A method to calculate the segment sizes
    /// - Parameters:
    ///   - values: PlottableValue as a variadic call to be able add as many as needed
    ///   - legend: Where the position of legend is located (default on bottom)
    /// - Returns: A View of the completed Pie Chart
    func chart(_ values: PlottableValue..., legend: Legend = .bottom) -> some View {
        let totalValue = values.reduce(0) { $0 + $1.value }
        var startAngle = -Double.pi / 2

        var pieSegments  = [PieSegment]()

        for data in values {
            let amount = .pi * 2 * (data.value / totalValue )
            let segment = PieSegment(data: data, startAngle: startAngle, amount: amount)
            pieSegments.append(segment)
            startAngle += amount
        }

       // A View of the combined segments
        var chartView: some View {
            ZStack {
                ForEach(pieSegments) { segment in
                    segment
                        .fill(segment.data.color)
                }
            }
        }

        // A View of the name of each segments
        var legendView: some View {
            ForEach(pieSegments) { segment in
                Label {
                    Text(segment.data.name)
                        .font(.caption)
                        .foregroundColor(.secondary)
                } icon: {
                    Circle()
                        .fill(segment.data.color)
                        .frame(width: 10)
                }
            }
        }

        // return View of completed switching on where chosen placement of legend
        return Group {
            switch legend {
            case .bottom:
                VStack {
                    chartView
                    HStack {
                       legendView
                    }
                }
            case .top:
                VStack {
                    HStack {
                        legendView
                    }
                    chartView
                }
            case .leading:
                HStack {
                    VStack(alignment: .leading) {
                       legendView
                    }
                    .padding(.leading)
                   chartView
                }
            case .trailing:
                HStack {
                   chartView
                    VStack(alignment: .leading) {
                       legendView
                    }
                    .padding(.trailing)
                }
            case .hidden:
                chartView
            }
        }
    }
}

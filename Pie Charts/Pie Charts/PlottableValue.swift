//
//  PlottableValue.swift
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

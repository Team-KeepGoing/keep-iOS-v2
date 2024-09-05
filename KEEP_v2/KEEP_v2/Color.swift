//
//  Color.swift
//  KEEP_v2
//
//  Created by bibiga on 9/5/24.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let cleanedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")
        var hexInt: UInt64 = 0
        Scanner(string: cleanedHex).scanHexInt64(&hexInt)
        let red = Double((hexInt >> 16) & 0xFF) / 255.0
        let green = Double((hexInt >> 8) & 0xFF) / 255.0
        let blue = Double(hexInt & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}

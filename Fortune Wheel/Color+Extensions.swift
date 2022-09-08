//
//  Color+Extensions.swift
//  Fortune Wheel
//
//  Created by Denis Onofras on 08.09.22.
//

import SwiftUI

extension Color {
    static let spin_wheel_color: [Color] = [Color(hex: "FBE488"), Color(hex: "75AB53"), Color(hex: "D1DC59"),
                                            Color(hex: "EC9D42"), Color(hex: "DE6037"), Color(hex: "DA4533"),
                                            Color(hex: "992C4D"), Color(hex: "433589"), Color(hex: "4660A8"),
                                            Color(hex: "4291C8")]
    
    init(hex: String, alpha: Double = 1) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) { cString.remove(at: cString.startIndex) }
        
        let scanner = Scanner(string: cString)
        scanner.currentIndex = scanner.string.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        self.init(.sRGB, red: Double(r) / 0xff, green: Double(g) / 0xff, blue:  Double(b) / 0xff, opacity: alpha)
    }
}

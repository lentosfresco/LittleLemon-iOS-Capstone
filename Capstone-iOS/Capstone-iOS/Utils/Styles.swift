//
//  Styles.swift
//  Capstone-iOS
//
//  Created by Wael Shabana on 2024-04-20.
//

import Foundation
import SwiftUI





extension String {
    func formatPhoneNumber() -> String {
        let cleanNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        let mask = "(XXX) XXX-XXXX"
        
        var formatted = ""
        var startIndex = cleanNumber.startIndex
        let endIndex = cleanNumber.endIndex
        
        for char in mask where startIndex < endIndex {
            if char == "X" {
                formatted.append(cleanNumber[startIndex])
                startIndex = cleanNumber.index(after: startIndex)
            } else {
                formatted.append(char)
            }
        }
        
        return formatted
    }
}

// Colors

extension Color{
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
    
    //Primary Colors
    static let primaryGreen = Color(hex: 0xF495E57)
    static let primaryYellow = Color(hex: 0xFF4CE14)
    
    //Secondary Colors
    static let secondaryDarkOrange = Color(hex: 0xFEE9972)
    static let secondaryLightOrange = Color(hex: 0xFFBDABB)
    static let highlightWhite = Color(hex: 0xFEDEFEE)
    static let highlightBlack = Color(hex: 0xF333333)
}
// Fonts

extension Font{
    
    //Markazi
    static let marKaziTitle = Font.custom("MarkaziText-Medium", size: 64)
    static let marKaziSubTitle = Font.custom("MarkaziText-Medium", size: 40)
    
    //Karla
    static let karlaLeadText = Font.custom("Karla-Medium", size: 18).bold()
    static let karlaSectionTitle = Font.custom("Karla-Medium", size: 20).bold().bold()
    static let karlaSectionCategory = Font.custom("Karla-Medium", size: 16).bold().bold()
    static let karlaCardTitle = Font.custom("Karla-Medium", size: 18).bold()
    static let karlaParagraph = Font.custom("Karla-Medium", size: 16)
}

//
//  ImageView.swift
//  Capstone-iOS
//
//  Created by Wael Shabana on 2024-04-22.
//

import SwiftUI

struct ImageView: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(.highlightWhite)
            .overlay(Image(.profile)
                .resizable()
                .frame(width: width, height: height)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/))
    }
}

#Preview {
    ImageView(width: 50, height: 50)
}

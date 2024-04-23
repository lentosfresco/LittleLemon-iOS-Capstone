//
//  ButtonView.swift
//  Capstone-iOS
//
//  Created by Wael Shabana on 2024-04-20.
//

import SwiftUI

struct ButtonView: View {
    let title:String
    let action:()->Void
    let isPrimary: Bool
    init(title: String, action: @escaping () -> Void, isPrimary:Bool = true) {
        self.title = title
        self.action = action
        self.isPrimary = isPrimary
    }
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(isPrimary ? .highlightWhite : Color.highlightBlack)
                .background(RoundedRectangle(cornerRadius: 5,style: .circular)
                    .foregroundColor(isPrimary ? .primaryGreen : Color.primaryYellow))
                .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
        }
    }
}


struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ButtonView(title: "Primary Button", action: {
                print("Primary Button tapped")
            })
            
            ButtonView(title: "Secondary Button", action: {
                print("Secondary Button tapped")
            }, isPrimary: false)
        }
        .padding()
    }
}

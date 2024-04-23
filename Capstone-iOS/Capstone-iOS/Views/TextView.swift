//
//  TextView.swift
//  Capstone-iOS
//
//  Created by Wael Shabana on 2024-04-20.
//

import SwiftUI

struct TextView: View {
    let label:String
    var value:Binding<String>
    var iconName:String
    var onTapAction:() -> Void
    init(label: String, value: Binding<String>,iconName:String = "",onTapAction:@escaping () -> Void = {}) {
        self.label = label
        self.value = value
        self.iconName = iconName
        self.onTapAction = onTapAction
    }
    var body: some View {
        TextField(label, text: value)
            .padding(.leading, 30)
            .background(Color.clear)
            .onChange(of: value.wrappedValue) { newValue in
                onTapAction()
            }
            .padding()
            .background(Color.highlightWhite)
            .cornerRadius(8)
            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
            .overlay(
                !iconName.isEmpty ? Image(systemName: iconName).padding(.leading, -165) : nil
            )
    }
}
    
    struct TextView_Previews: PreviewProvider {
        static var previews: some View {
            TextView(label: "Label", value: .constant("Value"), iconName: "person") {
                print("Text field tapped!")
            }
        }
    }


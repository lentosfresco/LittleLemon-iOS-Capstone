//
//  CheckBox.swift
//  Capstone-iOS
//
//  Created by Wael Shabana on 2024-04-20.
//

import SwiftUI

struct CheckboxToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()

        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")

                configuration.label
            }.foregroundColor(.primaryGreen)
        })
    }
}

struct CheckboxToggle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle("Toggle", isOn: .constant(true))
            .toggleStyle(CheckboxToggle())
            .padding()
    }
}

//
//  CategoryView.swift
//  Capstone-iOS
//
//  Created by Wael Shabana on 2024-04-20.
//

import SwiftUI

struct CategoryView:View {
    let title:String
    let isSelected:Bool
    
    init(title: String,isSelected:Bool) {
        self.title = title
        self.isSelected = isSelected
    }
    
    var body: some View{
        Text(title)
            .bold()
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(isSelected ? Color.primaryGreen : Color.highlightWhite)
            .cornerRadius(30)
            .foregroundColor(isSelected ? Color.highlightWhite : Color.primaryGreen)
    }
}


struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(title: "Breakfast", isSelected: true)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

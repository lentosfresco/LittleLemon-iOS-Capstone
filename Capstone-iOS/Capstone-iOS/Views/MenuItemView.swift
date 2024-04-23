//
//  MenuItemView.swift
//  Capstone-iOS
//
//  Created by Wael Shabana on 2024-04-20.
//

import SwiftUI
import CoreData

struct MenuItemView:View{
    let dish:Dish
    
    init(dish: Dish) {
        self.dish = dish
    }
    
    var body: some View{
        ZStack{
            HStack{
                VStack(alignment: .leading){
                    Text("\(dish.title ?? "")")
                        .font(.karlaLeadText)
                        .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                    Text("\(dish.desc ?? "")")
                        .lineLimit(2)
                        .fontWeight(.light)
                        .font(.karlaParagraph)
                        .foregroundColor(.primaryGreen)
                    Text("$ \(dish.price ?? "")")
                        .fontWeight(.heavy)
                        .font(.karlaLeadText)
                        .foregroundColor(.primaryGreen)
                        .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                }
                Spacer()
                AsyncImage(
                    url:URL(string: "\(dish.image ?? "")"),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100, maxHeight: 100)
                    },
                    placeholder: {
                        Rectangle().frame(width:  100, height: 70).foregroundColor(.highlightBlack)
                    }
                )
            }
            NavigationLink(destination: ItemDetailView(dish: dish)) {
                
            }.buttonStyle(PlainButtonStyle())
        }
    }
    
}



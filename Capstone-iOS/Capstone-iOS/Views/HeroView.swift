//
//  HeroView.swift
//  Capstone-iOS
//
//  Created by Wael Shabana on 2024-04-20.
//

import SwiftUI

struct HeroView: View{
    let bottomView:TextView?
    
    init(bottomView: TextView?) {
        self.bottomView = bottomView
    }
    
    var body:some View{
        VStack{
            VStack(alignment: .leading){
                Text(resturantTitle).font(.marKaziSubTitle).foregroundStyle(Color.primaryYellow)
                Text(resturantAddress).font(.karlaSectionTitle).foregroundColor(Color.highlightWhite)
                HStack{
                    Text(restaurantDesc)
                        .font(.karlaParagraph)
                        .foregroundColor(Color.highlightWhite)
                        .fixedSize(horizontal: false, vertical: true)
                    Image("Hero").resizable().frame(width: 130,height: 150)
                        .cornerRadius(10)
                }
            }
            bottomView
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 15, trailing: 10))
        .background(Color.primaryGreen)
    }
}


struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        let bottomTextView = TextView(label: "Label", value: .constant("Value"), iconName: "person") {
            print("Text field tapped!")
        }
        return HeroView(bottomView: bottomTextView)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

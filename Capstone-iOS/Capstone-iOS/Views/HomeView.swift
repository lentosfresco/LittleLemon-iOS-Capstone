//
//  HomeView.swift
//  Capstone-iOS
//
//  Created by Wael Shabana on 2024-04-20.
//

import SwiftUI

@available(iOS 17.0, *)
struct HomeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var isMenuScreen:Bool = true
    
    var body: some View {
        Section{
            if isMenuScreen{
                MenuView()
            }
            else{
                UserProfile(backAction:{
                    isMenuScreen = true
                })
            }
        }.navigationBarTitleDisplayMode(.inline)
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 15, trailing: 0))
            .background(Color.highlightWhite)
            .toolbar {
                if !isMenuScreen
                {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            isMenuScreen = true
                        } label: {
                            Image(systemName: "arrow.backward.circle.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.primaryGreen)
                        }
                        
                    }
                }
                ToolbarItem(placement: .principal) {
                    Image(.logo)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isMenuScreen = false
                    } label: {
//                        Image(.profile).resizable().frame(width: 50,height: 50)
                        ImageView(width: 50, height: 50)
                    }
                }
            }.navigationBarBackButtonHidden(true)
            
    }
}

@available(iOS 17.0, *)
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  MenuItem.swift
//  Capstone-iOS
//
//  Created by Wael Shabana on 2024-04-20.
//

import Foundation

struct MenuItem: Codable, Hashable, Identifiable {
    let id : Int
    let title: String
    let description: String
    let price: String
    let image: String
    let category:String
}



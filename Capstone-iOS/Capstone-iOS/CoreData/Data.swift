//
//  Data.swift
//  Capstone-iOS
//
//  Created by Wael Shabana on 2024-04-20.
//

import SwiftUI
import CoreData


struct Menu {
    
    func getMenuData(_ context:NSManagedObjectContext){
        PersistenceController.shared.clear()
        let url = URL(string: kURL)!
        let request = URLRequest(url: url)
        let downloadTask = URLSession.shared.dataTask(with: request){data, response, error in
            if let data = data{
                let dish = try! JSONDecoder().decode(MenuList.self, from: data)
                if(!dish.menu.isEmpty){
                    for dishItem in dish.menu
                    {
                        let myDish = Dish(context: context)
                        myDish.image = dishItem.image
                        myDish.price = dishItem.price
                        myDish.title = dishItem.title
                        myDish.desc = dishItem.description
                        myDish.category = dishItem.category
                    }
                    try? context.save()
                }
            }
        }
        downloadTask.resume()
    }
}

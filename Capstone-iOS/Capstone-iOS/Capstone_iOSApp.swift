//
//  Capstone_iOSApp.swift
//  Capstone-iOS
//
//  Created by Wael Shabana on 2024-04-19.
//

import SwiftUI

let persistenceController = PersistenceController.shared

@available(iOS 17.0, *)
@main
struct Capstone_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

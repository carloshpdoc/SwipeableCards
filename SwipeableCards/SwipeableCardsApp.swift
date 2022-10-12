//
//  SwipeableCardsApp.swift
//  SwipeableCards
//
//  Created by Carlos Henrique Pereira do Carmo on 11/10/22.
//

import SwiftUI

@main
struct SwipeableCardsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  ProjectApp.swift
//  Project
//
//  Created by Chetan Choudhary on 15/04/24.
//

import SwiftUI

@main
struct ProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            InitialView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

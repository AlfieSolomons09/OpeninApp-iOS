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

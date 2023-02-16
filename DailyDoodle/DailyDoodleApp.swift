//
//  DailyDoodleApp.swift
//  DailyDoodle
//
//  Created by Helena Oliveira on 13/02/23.
//

import SwiftUI

@main
struct DailyDoodleApp: App {

    let persistenceContainer = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            GalleryScreenView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}

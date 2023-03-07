//
//  DailyDoodleApp.swift
//  DailyDoodle
//
//  Created by Helena Oliveira on 13/02/23.
//

import SwiftUI

@main
struct DailyDoodleApp: App {

    let persistenceContainer = CoreDataManager.shared

    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding :Bool = true

    var body: some Scene {
        WindowGroup {
            if shouldShowOnboarding {
                OnboardingView()
            } else {
                ContentView()
                    .environment(\.managedObjectContext, persistenceContainer.persistentContainer.viewContext)
            }
        }
    }
}



import Foundation
import SwiftUI
import UIKit
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentCloudKitContainer
    static let shared: CoreDataManager = CoreDataManager()

    private init() {

        ValueTransformer.setValueTransformer(UIImageTransformer(), forName: NSValueTransformerName("UIImageTransformer"))

        persistentContainer = NSPersistentCloudKitContainer(name: "DailyDoodleModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize CoreData \(error)")
            }
        }

        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistentContainer.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }

    func saveContext(){
        let context = persistentContainer.viewContext

            if context.hasChanges{
            do {
                try context.save()

            } catch {
                let error = error as NSError
                fatalError("Unresolved Error: \(error.localizedDescription), \(error.userInfo)")
            }
        }
    }
}

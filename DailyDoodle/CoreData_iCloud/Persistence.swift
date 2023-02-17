//
//  Persistence.swift
//  DailyDoodle
//
//  Created by Ieda Xavier on 14/02/23.
//


import Foundation
import SwiftUI
import CoreData

class PersistenceController: ObservableObject {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    var draws: [Drawing] = []

    init() {
        container = NSPersistentCloudKitContainer(name: "DailyDoodleModel")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }

    func deleteDraw(offsets: IndexSet){
        withAnimation {
            offsets.map {draws [$0]}.forEach(self.container.viewContext.delete)
            saveContext()
        }
    }

    private func saveContext(){
        do {
            try self.container.viewContext .save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error: \(error)")
        }
    }

    func addDraw() {
        withAnimation {
            let newDraw = Drawing(context: self.container.viewContext)
            newDraw.challenge = "New Draw \(Date())"
            newDraw.date = Date()

            downloadImage()

            saveContext()
        }
    }

    private func downloadImage(){
        let url =  URL(string: "https://picsum.photos/200/300\(UUID().uuidString)")!

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            let draw = Drawing(context: self.container.viewContext)
            draw.challenge = "Teste"
            draw.date = Date()
            draw.imagJPEG = UIImage(data: data)
        }
    }
}

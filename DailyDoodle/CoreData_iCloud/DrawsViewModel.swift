//
//  DrawViewModel.swift
//  POC_CoreData
//
//  Created by Ieda Xavier on 18/02/23.
//

import SwiftUI
import UIKit
import CoreData

class DrawViewModel: ObservableObject {
    var context = CoreDataManager.shared.persistentContainer.viewContext
    var draws: [Drawing] = []


    init() {
        let request: NSFetchRequest<Drawing> = NSFetchRequest(entityName: "Drawing")

        do {
            self.draws = try context.fetch(request)

        } catch {
            print(error)
        }
    }


    func downloadImage(image: UIImage) {
        let draw = Drawing(context: self.context)
        draw.challenge = "Animals"
        draw.imagJPEG = image

        try? self.context.save()
    }

    func delete(draw: Drawing) {
        if draws.firstIndex(where: {$0.id == draw.id}) != nil{
            self.context.delete(draw)
            try? self.context.save()

        }
    }


}

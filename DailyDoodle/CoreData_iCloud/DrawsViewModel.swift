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
            let draws = try context.fetch(request)

        } catch {
            print(error)
        }
    }


    func downloadImage(image: UIImage) {

            let draw = Drawing(context: self.context)
            draw.challenge = "Random Photo"
            draw.imagJPEG = image

            try? self.context.save()

    }

    func deleteDraw(offsets: IndexSet){
          withAnimation {
              offsets.map {draws [$0]}.forEach(self.context.delete)
              try? self.context.save()
          }
      }
}


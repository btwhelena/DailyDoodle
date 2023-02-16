//
//  Drawing.swift
//  DailyDoodle
//
//  Created by Ieda Xavier on 14/02/23.
//

import Foundation
import UIKit
import CoreData


@objc(Drawing)
class Drawing: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Drawing> {
        return NSFetchRequest<Drawing>(entityName: "Drawing")
    }

    @NSManaged public var challenge: String?
    @NSManaged public var date: Date?
    @NSManaged public var imagJPEG: UIImage?

}

extension Drawing : Identifiable {

}

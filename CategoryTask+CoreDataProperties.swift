//
//  CategoryTask+CoreDataProperties.swift
//  calendar
//
//  Created by Anastasiya Osinskaya on 7/7/20.
//  Copyright © 2020 Anastasiya Osinskaya. All rights reserved.
//
//

import Foundation
import CoreData


extension CategoryTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryTask> {
        return NSFetchRequest<CategoryTask>(entityName: "CategoryTask")
    }

    @NSManaged public var category: String?
    @NSManaged public var dateReminder: Date?
    @NSManaged public var done: Bool
    @NSManaged public var titleTask: String?

}

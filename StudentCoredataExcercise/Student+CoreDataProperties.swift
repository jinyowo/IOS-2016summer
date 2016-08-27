//
//  Student+CoreDataProperties.swift
//  StudentCoredataExcercise
//
//  Created by 허진 on 2016. 8. 23..
//  Copyright © 2016년 Jin Her. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Student {

    @NSManaged var id: String?
    @NSManaged var name: String?
    @NSManaged var email: String?

}

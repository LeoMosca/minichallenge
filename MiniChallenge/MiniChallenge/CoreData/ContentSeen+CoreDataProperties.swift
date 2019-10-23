//
//  ContentSeen+CoreDataProperties.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 23/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//
//

import Foundation
import CoreData


extension ContentSeen {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContentSeen> {
        return NSFetchRequest<ContentSeen>(entityName: "ContentSeen")
    }

    @NSManaged public var lastSeen: Int16

}

//
//  TopicDone+CoreDataProperties.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 23/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//
//

import Foundation
import CoreData


extension TopicDone {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TopicDone> {
        return NSFetchRequest<TopicDone>(entityName: "TopicDone")
    }

    @NSManaged public var id_topic: Int16

}

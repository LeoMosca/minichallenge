//
//  LanguageAdded+CoreDataProperties.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 24/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//
//

import Foundation
import CoreData


extension LanguageAdded {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LanguageAdded> {
        return NSFetchRequest<LanguageAdded>(entityName: "LanguageAdded")
    }

    @NSManaged public var id_lang: Int16
    @NSManaged public var isDone: Bool
    @NSManaged public var topics: NSSet?

}

// MARK: Generated accessors for topics
extension LanguageAdded {

    @objc(addTopicsObject:)
    @NSManaged public func addToTopics(_ value: TopicDone)

    @objc(removeTopicsObject:)
    @NSManaged public func removeFromTopics(_ value: TopicDone)

    @objc(addTopics:)
    @NSManaged public func addToTopics(_ values: NSSet)

    @objc(removeTopics:)
    @NSManaged public func removeFromTopics(_ values: NSSet)

}

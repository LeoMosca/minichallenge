//
//  Entity+CoreDataProperties.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 11/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }


}

//
//  CoreDataManager.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 23/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    static let sharedInstance = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MiniChallenge")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // Operações para as Linguagens
    func getLanguages() -> [LanguageAdded] {
        do{
            let languages:[LanguageAdded] = try persistentContainer.viewContext.fetch(LanguageAdded.fetchRequest())
            return languages
        } catch {
            print("CoreData error")
        }
        return []
    }
    
    func insertLanguage(_ id:Int, _ done:Bool, topics: [TopicDone]) {
        guard let newPackage = NSEntityDescription.insertNewObject(forEntityName: "LanguageAdded", into: persistentContainer.viewContext) as? LanguageAdded else { return }
        let topicsToAdd:NSSet = NSSet()
        
        for t in topics {
            topicsToAdd.adding(t)
        }
        
        newPackage.id_lang = Int16(id)
        newPackage.isDone = done
        newPackage.topics = topicsToAdd
        saveContext()
    }
    
    func deleteLanguage(object:NSManagedObject) {
        persistentContainer.viewContext.delete(object)
        saveContext()
    }
    
    
    // Operações para os Tópicos
    func getTopics() -> [TopicDone] {
        do{
            let topics:[TopicDone] = try persistentContainer.viewContext.fetch(TopicDone.fetchRequest())
            return topics
        } catch {
            print("CoreData error")
        }
        return []
    }
    
    func insertTopic(_ id:Int, _ done:Bool, topics: [TopicDone]) {
        guard let newPackage = NSEntityDescription.insertNewObject(forEntityName: "LanguageAdded", into: persistentContainer.viewContext) as? LanguageAdded else { return }
        let topicsToAdd:NSSet = NSSet()
        
        for t in topics {
            topicsToAdd.adding(t)
        }
        
        newPackage.id_lang = Int16(id)
        newPackage.isDone = done
        newPackage.topics = topicsToAdd
        saveContext()
    }
    
    func deleteTopic(object:NSManagedObject) {
        persistentContainer.viewContext.delete(object)
        saveContext()
    }
}

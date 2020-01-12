//
//  CoreDataStack.swift
//  TehillimApp
//
//  Created by Mendy Barouk on 06/01/2020.
//  Copyright © 2020 Mendy Barouk. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack
{
    enum ModelName: String
    {
        case tehillimApp = "TehillimApp"
    }
    
    static let shared = CoreDataStack()
    
    private init() {}
    
    private lazy var mainContext: NSManagedObjectContext = {
        
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        managedObjectContext.persistentStoreCoordinator = self.psc
        
        return managedObjectContext
    }()
    
    lazy var psc: NSPersistentStoreCoordinator = {
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        return psc
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        
        let modelURL = Bundle.main.url(forResource: ModelName.tehillimApp.rawValue, withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container: NSPersistentContainer
        if #available(iOS 13.0, *)
        {
            container = NSPersistentCloudKitContainer(name: ModelName.tehillimApp.rawValue)
        }
        else
        {
            container = NSPersistentContainer(name: ModelName.tehillimApp.rawValue)
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError?
            {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext ()
    {
        mainContext.performAndWait {
            mainContext.saveLastChanges()
        }
    }
}

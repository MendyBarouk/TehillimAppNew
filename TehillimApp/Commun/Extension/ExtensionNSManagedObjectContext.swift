//
//  ExtensionNSManagedObjectContext.swift
//  TehillimApp
//
//  Created by Mendy Barouk on 06/01/2020.
//  Copyright © 2020 Mendy Barouk. All rights reserved.
//

import CoreData

extension NSManagedObjectContext
{
    func saveLastChanges()
    {
        guard hasChanges else { return }
        
        do
        {
            try save()
        }
        catch let error as NSError
        {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
}

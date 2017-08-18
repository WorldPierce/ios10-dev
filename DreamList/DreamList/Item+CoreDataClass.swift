//
//  Item+CoreDataClass.swift
//  DreamList
//
//  Created by Billy Pierce on 8/16/17.
//  Copyright © 2017 Billy Pierce. All rights reserved.
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
    }
}

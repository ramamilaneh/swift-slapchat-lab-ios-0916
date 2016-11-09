//
//  Message+CoreDataProperties.swift
//  SlapChat
//
//  Created by Rama Milaneh on 11/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Message {

    class var  fetch: NSFetchRequest<Message> {
        return NSFetchRequest<Message>(entityName: "Message");
    }

    @NSManaged public var content: String
    @NSManaged public var createdAt: NSDate

}

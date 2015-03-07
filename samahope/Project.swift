//
//  Project.swift
//  samahope
//
//  Created by Isaac Ho on 3/6/15.
//  Copyright (c) 2015 Codepath. All rights reserved.
//

import Foundation

class Project : PFObject, PFSubclassing {
    @NSManaged var name: String?
    @NSManaged var shortDescription: String?
    @NSManaged var longDescription: String?
    @NSManaged var startDate: String?
    @NSManaged var mainImageUrl: String?
    @NSManaged var secondaryImageUrl: String?
    @NSManaged var doctorName : String?
    @NSManaged var doctorBio: String?
    
    // donations
    @NSManaged var operationName: String?
    @NSManaged var totalDonated : String? // in dollars
    @NSManaged var numDonations: String?
    @NSManaged var costPerOperation: String? // in dollars

    override init() {
        super.init()
    }
    override class func initialize() {
        var onceToken : dispatch_once_t = 0;
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    class func parseClassName() -> String! {
        return "Project"
    }

}
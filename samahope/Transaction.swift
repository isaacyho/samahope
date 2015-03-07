//
//  Transaction.swift
//  samahope
//
//  Created by Isaac Ho on 3/6/15.
//  Copyright (c) 2015 Codepath. All rights reserved.
//

import Foundation

class Transaction : PFObject {
    var donorID: String?
    var amount : Int? // in dollars
    var timeStamp: String?
    var project: Project?
    
    //func saveObject() not yet implemented
}
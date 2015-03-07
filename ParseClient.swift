//
//  ParseClient.swift
//  samahope
//
//  Created by Isaac Ho on 3/6/15.
//  Copyright (c) 2015 Codepath. All rights reserved.
//

import Foundation

class ParseClient {
    
    class func loadEvents() -> Array<Event> {
        var events = Array< Event >()
        var query = Event.query()
        //query.includeKey( "projects" )
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects.count) objects.")
                
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        println(object.objectId)
                        var event = object as Event
                        var pp = event["projects"] as NSArray
                        
                        event.projects = Array<Project>()
                        for i in 0...pp.count {
                            var myp = pp[ i ] as PFObject
                            var projectQuery = Project.query()
                            projectQuery.whereKey( "objectId", equalTo: myp.objectId)
                            
                            var projectObjects = projectQuery.findObjects()
                            if let projectObjects = projectObjects as? [PFObject] {
                                for projectObject in projectObjects {
                                    var project = projectObject as Project
                                    
                                    println( "this project: \(project)" ) 
                                    event.projects.append( project )
                                }
                            }
                            
                        }

                        // done loading event
                        events.append( event )

                    }
                }
            } else {
                // Log details of the failure
                println("Error: \(error) \(error.userInfo!)")
            }
        }

        
        return events
        

    }
    class func buildTestDb() {
        var p = Project()
        p.shortDescription = "Save all the arms in the world"
        p.name = "save arms"
        p.doctorName = "Dr. Seymour Butts"
        
        var e = Event()
        e.name = "Donate-a-thon"
        
        e.projects.append( p )
        
        if ( e.save() ) { println( "save succeeded" ) }
        else
        {
            println( "save failed" )
        }
    }
    
    
    // just for sanity--retrieves all the doctor records
    class func testQuery() {
        var query = PFQuery(className:"Doctor")
//        query.whereKey("playerName", equalTo:"Sean Plott")
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects.count) objects.")
                
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        println(object.objectId)
                    }
                }
            } else {
                // Log details of the failure
                println("Error: \(error) \(error.userInfo!)")
            }
        }
    }
}
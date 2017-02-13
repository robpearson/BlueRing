//
//  Project.swift
//  BlueRing
//
//  Created by Robert Pearson on 13/2/17.
//  Copyright © 2017 Rob Pearson. All rights reserved.
//

import Cocoa

class Project: NSObject {

    var id : String
    var name : String
    var projectDescription : String

    init(id: String, name: String, projectDescription: String) {
        self.id = id
        self.name = name
        self.projectDescription = projectDescription
    }

}

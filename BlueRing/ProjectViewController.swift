//
//  ProjectViewController.swift
//  BlueRing
//
//  Created by Robert Pearson on 23/2/17.
//  Copyright © 2017 Rob Pearson. All rights reserved.
//

import Cocoa

class ProjectViewController: NSViewController {

    @IBOutlet weak var projectNameTextField: NSTextField!
    @IBOutlet weak var devReleaseTextField: NSTextField!
    @IBOutlet weak var testReleaseTextField: NSTextField!
    @IBOutlet weak var prodReleaseTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func update(project: Project) {
        // do UI updates on the main thread
        DispatchQueue.main.async {
            self.projectNameTextField.stringValue = project.name
            self.devReleaseTextField.stringValue = (project.releasesByEnvironment["dev"]?.first)!
            self.testReleaseTextField.stringValue = (project.releasesByEnvironment["test"]?.first)!
            self.prodReleaseTextField.stringValue = (project.releasesByEnvironment["prod"]?.first)!
        }
    }
    
}

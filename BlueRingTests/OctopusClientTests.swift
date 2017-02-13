//
//  OctopusServiceTests.swift
//  BlueRingTests
//
//  Created by Robert Pearson on 9/2/17.
//  Copyright © 2017 Rob Pearson. All rights reserved.
//

import XCTest
import Nimble
import RxSwift
@testable import BlueRing

class OctopusClientTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testBasicOctopusApiCall() {
        
        // Given
        let service = OctopusClient()
        
        // When
        let projectsObservable = service.getAllProjects()
        
        // Then
        let projectSubscription = projectsObservable.subscribe(onNext: { tmpProject in
            print(tmpProject)
            expect(tmpProject).to(contain("Projects-141"))
        })
        
        Thread.sleep(forTimeInterval: 5) // Dodgy while I get back up to speed w/ Rx
        
        projectSubscription.dispose()

    }
    
}

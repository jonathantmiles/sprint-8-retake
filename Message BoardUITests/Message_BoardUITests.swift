//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    // creating threads
    func testCreateThread() {
        //let app = XCUIApplication()
        let messageThreadsTableViewPage = MessageThreadsTableViewTestPage(testCase: self)
        
        messageThreadsTableViewPage.typeTextIn(with: "Hello, I am a test")
        
        // recorded section
        //XCUIApplication().tables["Empty list"].textFields["Create a new thread:"].tap()
        
    }
    
    
    
}

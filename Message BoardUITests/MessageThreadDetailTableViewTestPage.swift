//
//  MessageThreadDetailTableViewTestPage.swift
//  Message BoardUITests
//
//  Created by Jonathan T. Miles on 10/20/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadDetailTableViewTestPage: TestPage {
    var testCase: XCTestCase
    
    // Elements
    
    // title of the vc
    var titleOfVC: XCUIElement {
        return app.navigationBars.staticTexts.element
    }
    // cells
    func cellAt(index: Int) -> XCUIElement {
        return app.tables.children(matching: .cell).element(boundBy: index)
    }
    // title text
    func cellTitle(index: Int) -> XCUIElement {
        return cellAt(index: index).children(matching: .staticText).element
    }
    // subtitle text
    func cellSubtitle(index: Int) -> XCUIElement {
        return cellAt(index: index).children(matching: .staticText).element
    }
    // addNew button
    var addButton: XCUIElement {
        return app.navigationBars.staticTexts["Add"]
    }
    // back button
    var backButton: XCUIElement {
        return app.navigationBars.staticTexts["λ Message Board"]
    }
    
    // Actions
    
    // tap on addNew
    @discardableResult func tapOnAddButton(file: String = #file, line: UInt = #line) -> MessageDetailViewTestPage {
        testCase.expect(exists: addButton)
        addButton.tap()
        return MessageDetailViewTestPage(testCase: testCase)
    }
    // tap on back button
    @discardableResult func tapOnBackButton(file: String = #file, line: UInt = #line) -> MessageThreadsTableViewTestPage {
        testCase.expect(exists: backButton)
        backButton.tap()
        return MessageThreadsTableViewTestPage(testCase: testCase)
    }
    
    // Verifications
    
    // is the title text the same as the cell that triggered the segue
    // do the addNew and back buttons produce the right VCs
    
}

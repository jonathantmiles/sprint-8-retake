//
//  MessageThreadsTableViewTestPage.swift
//  Message BoardUITests
//
//  Created by Jonathan T. Miles on 10/20/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadsTableViewTestPage: TestPage {
    let testCase: XCTestCase
    
    // Elements
    
    // cell
    func cellAt(index: Int) -> XCUIElement {
        return app.tables.children(matching: .cell).element(boundBy: index)
    }
    // cell title
    func cellTitle(index: Int) -> XCUIElement {
        return cellAt(index: index).children(matching: .staticText).element
    }
    // textfield
    var messageTextField: XCUIElement {
        return app.textFields["MessageThreadsTableViewController.TextField"]
    }
    
    // Actions
    
    // finish typing in textfield
    @discardableResult func typeTextIn(textField: XCUIElement, with text: String) -> MessageThreadsTableViewTestPage {
        testCase.expect(exists: textField)
        textField.tap()
        textField.typeText(text)
        return self
    }
    // tap on cell
    @discardableResult func tapOnMessageThreadCell(index: Int) -> MessageThreadDetailTableViewTestPage {
        let cell = cellAt(index: index)
        testCase.expect(exists: cell)
        cell.tap()
        return MessageThreadDetailTableViewTestPage(testCase: testCase)
    }
    
    // Verifications
    
    // new cell created
    @discardableResult func verifyCell(is index: Int, withText text: String) -> MessageThreadsTableViewTestPage {
        let title = cellTitle(index: index)
        testCase.expect(exists: title)
        XCTAssertEqual(title.title, text)
        return self
    }
    // transition to next VC?
    
}

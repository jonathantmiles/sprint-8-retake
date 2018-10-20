//
//  MessageDetailViewTestPage.swift
//  Message BoardUITests
//
//  Created by Jonathan T. Miles on 10/20/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageDetailViewTestPage: TestPage {
    var testCase: XCTestCase
    
    // Elements
    
    // textfield
    var titleTextField: XCUIElement {
        return app.textFields.element
    }
    // textView
    var bodyTextField: XCUIElement {
        return app.textViews.element
    }
    // send button
    var sendButton: XCUIElement {
        return app.navigationBars.buttons.staticTexts["Send"]
    }
    // back button
    var backButton: XCUIElement {
        return app.navigationBars.staticTexts.buttons.firstMatch
    }
    
    // Actions
    
    // type in textField
    @discardableResult func typeInTextField(text: String, file: String = #file, line: UInt = #line) -> MessageDetailViewTestPage {
        testCase.expect(exists: titleTextField)
        titleTextField.tap()
        titleTextField.typeText(text)
        return self
    }
    // type in textView
    @discardableResult func typeInTextView(text: String, file: String = #file, line: UInt = #line) -> MessageDetailViewTestPage {
        testCase.expect(exists: bodyTextField)
        bodyTextField.tap()
        bodyTextField.typeText(text)
        return self
    }
    // tap send button
    @discardableResult func tapSendButton(file: String = #file, line: UInt = #line) -> MessageThreadDetailTableViewTestPage {
        testCase.expect(exists: sendButton)
        sendButton.tap()
        return MessageThreadDetailTableViewTestPage(testCase: testCase)
    }
    // tap back button
    @discardableResult func tapBackButton(file: String = #file, line: UInt = #line) -> MessageThreadDetailTableViewTestPage {
        testCase.expect(exists: backButton)
        backButton.tap()
        return MessageThreadDetailTableViewTestPage(testCase: testCase)
    }
    
    // Verifications
    
    // did previous VC add a new cell
    // is the title and subtitle text right
}

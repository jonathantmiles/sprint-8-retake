//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase {
    
    // expected to decode Array<Any> but found a dictionary instead"
    // same thing but with CodingKey .messages
    // this still fails, even though there are no errors; maybe the database is clean?
    // the way the code is written in the project, the array will always be empty rather than nil if there's no data
    func testFetchingMessageThreads() {
        let testExpectation = expectation(description: "waitForDataSession")
        messageThreadController.fetchMessageThreads {
            XCTAssertGreaterThan(self.messageThreadController.messageThreads.count, 0)
            testExpectation.fulfill()
        }
       
       waitForExpectations(timeout: 15.0, handler: nil)
    }
    
    // no data displayed in tableView
    // bugs? or is there nothing in the returned data?
    // changed messageText in MessageThread.Message to be text, because of an error, and now it matches the mock JSON data
    
    // so I went to the url and found a problem:
    // the JSON is messed up because the last entry breaks the hierarchy. it's messages : UUID etc, and I'm getting the following error:
    // Error decoding message threads from JSON data: keyNotFound(CodingKeys(stringValue: "title", intValue: nil), Swift.DecodingError.Context(codingPath: [_DictionaryCodingKey(stringValue: "messages", intValue: nil)], debugDescription: "No value associated with key CodingKeys(stringValue: \"title\", intValue: nil) (\"title\").", underlyingError: nil))
    // this means I'll never get the app to "work" because it will  never decode JSON correctly.
    
    // but I can still log the other bugs I find:
    
    // createMessageThread had no .resume() at the end
    func testCreateMessageThread() {
        let testExpectation = expectation(description: "waitForDataSession")
        messageThreadController.createMessageThread(with: "title of thread") {
            testExpectation.fulfill()
        }
        waitForExpectations(timeout: 15.0, handler: nil)
    }
    
    let messageThreadController = MessageThreadController()
}

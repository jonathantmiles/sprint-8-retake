//
//  XCTestCaseExtension.swift
//  Message BoardUITests
//
//  Created by Jonathan T. Miles on 10/20/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

extension XCTestCase {
    func expect(exists element: XCUIElement, file: String = #file, line: UInt = #line) {
        if !element.exists {
            recordFailure(withDescription: "Expected \(element) to exist.", inFile: file, atLine: Int(line), expected: true)
        }
    }
}

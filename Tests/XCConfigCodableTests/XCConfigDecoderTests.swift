//
//  File.swift
//  
//
//  Created by Olivier Tavel on 29/10/2021.
//

import XCTest
@testable import XCConfigCodable

final class XCConfigDecoderTests: XCTestCase {
    var test1Url: URL {
        guard let url = Bundle.module.url(forResource: "test1", withExtension: "xcconfig") else {
            fatalError("Missing file: test1.xcconfig")
        }
        
        return url
    }

    func testLoadXCConfigData() throws {
        // Given
        let data = try Data(contentsOf: test1Url)
        let string = String(data: data, encoding: .utf8)
        
        // When
        dump(string)
        
        // Then
        XCTAssertNotNil(string)
    }
}

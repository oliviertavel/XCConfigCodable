//
//  File.swift
//  
//
//  Created by Olivier Tavel on 29/10/2021.
//

import Foundation

public class XCConfigEncoder {
    /// Returns a strings file-encoded representation of the specified value.
    public func encode<T: Encodable>(_ value: T) throws -> String {
        let stringsEncoding = XCConfigEncoding()
        try value.encode(to: stringsEncoding)
        return dotStringsFormat(from: stringsEncoding.data.strings)
    }
    
    private func dotStringsFormat(from strings: [String: String]) -> String {
        var dotStrings = strings.map { "\($0) = \($1)" }
        dotStrings.sort()
        return dotStrings.joined(separator: "\n")
    }
}

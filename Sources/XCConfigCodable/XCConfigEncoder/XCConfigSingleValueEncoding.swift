//
//  XCConfigSingleValueEncoding.swift
//  
//
//  Created by Olivier Tavel on 29/10/2021.
//

import Foundation

struct XCConfigSingleValueEncoding: SingleValueEncodingContainer {
    
    private let data: XCConfigEncoding.Data
    
    init(to data: XCConfigEncoding.Data) {
        self.data = data
    }

    var codingPath: [CodingKey] = []
    
    mutating func encodeNil() throws {
        data.encode(key: codingPath, value: "nil")
    }
    
    mutating func encode(_ value: Bool) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: String) throws {
        data.encode(key: codingPath, value: value)
    }
    
    mutating func encode(_ value: Double) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: Float) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: Int) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: Int8) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: Int16) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: Int32) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: Int64) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: UInt) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: UInt8) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: UInt16) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: UInt32) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode(_ value: UInt64) throws {
        data.encode(key: codingPath, value: value.description)
    }
    
    mutating func encode<T: Encodable>(_ value: T) throws {
        var stringsEncoding = XCConfigEncoding(to: data)
        stringsEncoding.codingPath = codingPath
        try value.encode(to: stringsEncoding)
    }
}

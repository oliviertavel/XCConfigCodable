//
//  XCConfigUnkeyedEncoding.swift
//  
//
//  Created by Olivier Tavel on 29/10/2021.
//

import Foundation
 
struct XCConfigUnkeyedEncoding: UnkeyedEncodingContainer {

    private let data: XCConfigEncoding.Data
    
    init(to data: XCConfigEncoding.Data) {
        self.data = data
    }
    
    var codingPath: [CodingKey] = []

    private(set) var count: Int = 0
    
    private mutating func nextIndexedKey() -> CodingKey {
        let nextCodingKey = IndexedCodingKey(intValue: count)!
        count += 1
        return nextCodingKey
    }
    
    private struct IndexedCodingKey: CodingKey {
        let intValue: Int?
        let stringValue: String

        init?(intValue: Int) {
            self.intValue = intValue
            self.stringValue = intValue.description
        }

        init?(stringValue: String) {
            return nil
        }
    }

    mutating func encodeNil() throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: "nil")
    }
    
    mutating func encode(_ value: Bool) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: String) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value)
    }
    
    mutating func encode(_ value: Double) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: Float) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: Int) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: Int8) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: Int16) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: Int32) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: Int64) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: UInt) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: UInt8) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: UInt16) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: UInt32) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode(_ value: UInt64) throws {
        data.encode(key: codingPath + [nextIndexedKey()], value: value.description)
    }
    
    mutating func encode<T: Encodable>(_ value: T) throws {
        var stringsEncoding = XCConfigEncoding(to: data)
        stringsEncoding.codingPath = codingPath + [nextIndexedKey()]
        try value.encode(to: stringsEncoding)
    }
    
    mutating func nestedContainer<NestedKey: CodingKey>(
        keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> {
        var container = XCConfigKeyedEncoding<NestedKey>(to: data)
        container.codingPath = codingPath + [nextIndexedKey()]
        return KeyedEncodingContainer(container)
    }
    
    mutating func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        var container = XCConfigUnkeyedEncoding(to: data)
        container.codingPath = codingPath + [nextIndexedKey()]
        return container
    }
    
    mutating func superEncoder() -> Encoder {
        var stringsEncoding = XCConfigEncoding(to: data)
        stringsEncoding.codingPath.append(nextIndexedKey())
        return stringsEncoding
    }
}

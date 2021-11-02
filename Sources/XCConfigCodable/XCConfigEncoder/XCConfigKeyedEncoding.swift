//
//  XCConfigKeyedEncoding.swift
//  
//
//  Created by Olivier Tavel on 29/10/2021.
//

import Foundation

struct XCConfigKeyedEncoding<Key: CodingKey>: KeyedEncodingContainerProtocol {

    private let data: XCConfigEncoding.Data
    
    init(to data: XCConfigEncoding.Data) {
        self.data = data
    }
    
    var codingPath: [CodingKey] = []
    
    mutating func encodeNil(forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: "nil")
    }
    
    mutating func encode(_ value: Bool, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: String, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value)
    }
    
    mutating func encode(_ value: Double, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: Float, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: Int, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: Int8, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: Int16, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: Int32, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: Int64, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: UInt, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: UInt8, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: UInt16, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: UInt32, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode(_ value: UInt64, forKey key: Key) throws {
        data.encode(key: codingPath + [key], value: value.description)
    }
    
    mutating func encode<T: Encodable>(_ value: T, forKey key: Key) throws {
        var stringsEncoding = XCConfigEncoding(to: data)
        stringsEncoding.codingPath.append(key)
        try value.encode(to: stringsEncoding)
    }
    
    mutating func nestedContainer<NestedKey: CodingKey>(keyedBy keyType: NestedKey.Type, forKey key: Key) -> KeyedEncodingContainer<NestedKey> {
        var container = XCConfigKeyedEncoding<NestedKey>(to: data)
        container.codingPath = codingPath + [key]
        return KeyedEncodingContainer(container)
    }
    
    mutating func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        var container = XCConfigUnkeyedEncoding(to: data)
        container.codingPath = codingPath + [key]
        return container
    }
    
    mutating func superEncoder() -> Encoder {
        let superKey = Key(stringValue: "super")!
        return superEncoder(forKey: superKey)
    }
    
    mutating func superEncoder(forKey key: Key) -> Encoder {
        var stringsEncoding = XCConfigEncoding(to: data)
        stringsEncoding.codingPath = codingPath + [key]
        return stringsEncoding
    }
}

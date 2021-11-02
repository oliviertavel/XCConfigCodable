//
//  XCConfigEncoding.swift
//  
//
//  Created by Olivier Tavel on 29/10/2021.
//

import Foundation

struct XCConfigEncoding: Encoder {
    
    /// Stores the actual strings file data during encoding.
    final class Data {
        private(set) var strings: [String: String] = [:]
        
        func encode(key codingKey: [CodingKey], value: String) {
            let key = codingKey.map { $0.stringValue }.joined(separator: ".")
            strings[key] = value
        }
    }
    
    var data: Data
    
    init(to encodedData: Data = Data()) {
        self.data = encodedData
    }

    var codingPath: [CodingKey] = []
    
    let userInfo: [CodingUserInfoKey : Any] = [:]
    
    func container<Key: CodingKey>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> {
        var container = XCConfigKeyedEncoding<Key>(to: data)
        container.codingPath = codingPath
        return KeyedEncodingContainer(container)
    }
    
    func unkeyedContainer() -> UnkeyedEncodingContainer {
        var container = XCConfigUnkeyedEncoding(to: data)
        container.codingPath = codingPath
        return container
   }
    
    func singleValueContainer() -> SingleValueEncodingContainer {
        var container = XCConfigSingleValueEncoding(to: data)
        container.codingPath = codingPath
        return container
    }
}

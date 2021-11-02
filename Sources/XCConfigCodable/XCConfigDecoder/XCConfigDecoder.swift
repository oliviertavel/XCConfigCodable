//
//  File.swift
//  File
//
//  Created by Olivier Tavel on 14/08/2021.
//

import Foundation

public class XCConfigDecoder {
    
}

struct XCConfigDecoding: Decoder {
    var codingPath: [CodingKey]
    
    var userInfo: [CodingUserInfoKey : Any]
    
    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        <#code#>
    }
    
    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        <#code#>
    }
    
    func singleValueContainer() throws -> SingleValueDecodingContainer {
        <#code#>
    }
    
    
}


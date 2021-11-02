//
//  File.swift
//  
//
//  Created by Olivier Tavel on 29/10/2021.
//

import Foundation

struct TestEncoder: Encodable {
    var bool: Bool
    var string: String
    var int: Int
    var float: Float
    var double: Double
    
    enum CodingKeys: String, CodingKey {
        case bool = "BOOL"
        case string = "STRING"
        case int = "INT"
        case float = "FLOAT"
        case double = "DOUBLE"
    }
}

extension TestEncoder {
    static var stubTrue: Self { TestEncoder(bool: true, string: "TestEncoder", int: 1, float: 3.14, double: .pi) }
    static var stubFalse: Self { TestEncoder(bool: false, string: "TestEncoder", int: 1, float: 3.14, double: .pi)}
}

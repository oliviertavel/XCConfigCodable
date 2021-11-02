import XCTest
@testable import XCConfigCodable

final class XCConfigEncoderTests: XCTestCase {
    
    func testEncodeTest() throws {
        // Given
        let test = TestEncoder.stubTrue
        let encoder = XCConfigEncoder()

        // When
        let result = try encoder.encode(test)
        
        // Then
        print(result)
    }
}

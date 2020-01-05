import XCTest
import CoreLocation
@testable import XGPS

final class XGPSTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        var lm = CLLocationManager()
//        XCTAssertEqual(XGPSlib().getCoordinate(lm))
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

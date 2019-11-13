import XCTest
@testable import OCI

final class OCITests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(OCI().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
    func testConnect(){
       let connection = Connection()
        connection.connect(username: "APEX_OFICINA",
                           password: "QASOTS",
                           host: "exapbg01-scan",
                           port: 1523,
                           serviceName: "QASOTS")
        let stm  = connection.createStatement()
        stm.executeQuery(sql:"select * from dual")
     //   XCTAssertEqual(connection,nil)
    }
}

import UIKit
import XCTest
import BXModel
import SwiftyJSON

class Model{
    let uid:UInt64
    let name:String
    let created:NSDate
    
    init(json:JSON){
        self.uid = json["uid"].uInt64Value
        self.name = json["name"].stringValue
        self.created = NSDate(timeIntervalSince1970: json["created"].doubleValue)
    }
}

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        let count  = UnsafeMutablePointer<UInt32>.alloc(1)
        let obc_property_t_list =  class_copyPropertyList(Model.self, count)
        XCTAssertEqual(3,count.memory)
        
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}

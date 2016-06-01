//
//  VerifierTests.swift
//  SwiftMockGen
//
//  Created by Curtis Badke on 2016-06-01.
//  Copyright © 2016 DevFacto Technologies. All rights reserved.
//

import XCTest


class CallVerifierTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_RecordingACall_DoesNotThrowError() {

        let sut = CallVerifier()
        sut.Record("someMethod")

    }

    func test_VerifyWithoutRecordingACall_ReturnsFalse() {
        let sut = CallVerifier()

        let response = sut.Verify("someMethod")

        XCTAssertFalse(response)
    }

    func test_VerifyAfterRecordingACall_ReturnsTrue() {
        let sut = CallVerifier()

        sut.Record("someMethod")
        let response = sut.Verify("someMethod")

        XCTAssertTrue(response)
    }

    func test_VerifyAfterRecordADifferentCall_ReturnsFalse() {
        let sut = CallVerifier()

        sut.Record("someMethod")
        let response = sut.Verify("someOtherMethod")

        XCTAssertFalse(response)
    }

    func test_RecordingACallWithArguments_DoesNotThrowError() {
        let sut = CallVerifier()

        sut.Record("someMethodTakesInt", 123)
    }

    func test_VerifyingWithoutArguments_MatchesAnyRecordedCallWithName() {
        let sut = CallVerifier()

        sut.Record("someMethod", 123)
        let response = sut.Verify("someMethod")

        XCTAssertTrue(response)
    }

    func test_VerifyingWithArguments_MatchesRecordedCallWithSameNameAndArguments() {
        let sut = CallVerifier()

        sut.Record("someMethod", 123)
        let response = sut.Verify("someMethod", 123)

        XCTAssertTrue(response)
    }

    func test_VerifyingWithArguments_DoesNotMatchRecordedCallWithDifferentArguments() {
        let sut = CallVerifier()

        sut.Record("someMethod", 123)
        let response = sut.Verify("someMethod", 789)

        XCTAssertFalse(response)
    }

    func test_VerifyingWithMultipleArguments_FailsIfOrderMismatch() {
        let sut = CallVerifier()

        sut.Record("someMethod", 123, 789)
        let response = sut.Verify("someMethod", 789, 123)

        XCTAssertFalse(response)
    }

    func test_VerifyingWithMultipleArguments_SucceedsIfOrderMatches() {
        let sut = CallVerifier()

        sut.Record("someMethod", 123, 789)
        let response = sut.Verify("someMethod", 123, 789)

        XCTAssertTrue(response)
    }

    func test_CanVerifyWithCustomObject() {
        class custom {
            let Property: String
            init (prop: String) {
                Property = prop
            }
        }

        let obj = custom(prop: "propVal")
        let sut = CallVerifier()

        sut.Record("call", obj)
        let response = sut.Verify("call", obj)

        XCTAssertTrue(response)
    }

    func test_VerifyingCallsWithDifferentObjects_Fails() {
        class custom {
            let Property: String
            init (prop: String) {
                Property = prop
            }
        }

        let obj1 = custom(prop: "propVal")
        let obj2 = custom(prop: "otherVal")
        let sut = CallVerifier()

        sut.Record("call", obj1)
        let response = sut.Verify("call", obj2)

        XCTAssertFalse(response)
    }

    func test_VerifyingCallsWithEquivalentObjects_Passes() {
        class custom {
            let Property: String
            init (prop: String) {
                Property = prop
            }
        }

        let obj1 = custom(prop: "propVal")
        let obj2 = custom(prop: "propVal")
        let sut = CallVerifier()

        sut.Record("call", obj1)
        let response = sut.Verify("call", obj2)

        XCTAssertTrue(response)
    }

    //func testPerformanceExample() {
    //    // This is an example of a performance test case.
    //    self.measureBlock {
    //        // Put the code you want to measure the time of here.
    //    }
    //}

}

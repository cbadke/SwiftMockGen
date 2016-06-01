//
//  VerifierTests.swift
//  SwiftMockGen
//
//  Created by Curtis Badke on 2016-06-01.
//  Copyright © 2016 DevFacto Technologies. All rights reserved.
//

import XCTest

private class custom : CustomStringConvertible {
    let Property: String
    init (prop: String) { Property = prop }

    //CustomStringConvertible
    var description: String { get { return "Property=\(Property)" } }
}

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
        sut.record("someMethod")

    }

    func test_VerifyWithoutRecordingACall_ReturnsFalse() {
        let sut = CallVerifier()

        let response = sut.verify("someMethod")

        XCTAssertFalse(response)
    }

    func test_VerifyAfterRecordingACall_ReturnsTrue() {
        let sut = CallVerifier()

        sut.record("someMethod")
        let response = sut.verify("someMethod")

        XCTAssertTrue(response)
    }

    func test_VerifyAfterRecordADifferentCall_ReturnsFalse() {
        let sut = CallVerifier()

        sut.record("someMethod")
        let response = sut.verify("someOtherMethod")

        XCTAssertFalse(response)
    }

    func test_RecordingACallWithArguments_DoesNotThrowError() {
        let sut = CallVerifier()

        sut.record("someMethodTakesInt", 123)
    }

    func test_VerifyingWithoutArguments_MatchesAnyRecordedCallWithName() {
        let sut = CallVerifier()

        sut.record("someMethod", 123)
        let response = sut.verify("someMethod")

        XCTAssertTrue(response)
    }

    func test_VerifyingWithArguments_MatchesRecordedCallWithSameNameAndArguments() {
        let sut = CallVerifier()

        sut.record("someMethod", 123)
        let response = sut.verify("someMethod", 123)

        XCTAssertTrue(response)
    }

    func test_VerifyingWithArguments_DoesNotMatchRecordedCallWithDifferentArguments() {
        let sut = CallVerifier()

        sut.record("someMethod", 123)
        let response = sut.verify("someMethod", 789)

        XCTAssertFalse(response)
    }

    func test_VerifyingWithMultipleArguments_FailsIfOrderMismatch() {
        let sut = CallVerifier()

        sut.record("someMethod", 123, 789)
        let response = sut.verify("someMethod", 789, 123)

        XCTAssertFalse(response)
    }

    func test_VerifyingWithMultipleArguments_SucceedsIfOrderMatches() {
        let sut = CallVerifier()

        sut.record("someMethod", 123, 789)
        let response = sut.verify("someMethod", 123, 789)

        XCTAssertTrue(response)
    }

    func test_CanVerifyWithCustomObject() {
        let obj = custom(prop: "propVal")
        let sut = CallVerifier()

        sut.record("call", obj)
        let response = sut.verify("call", obj)

        XCTAssertTrue(response)
    }

    func test_VerifyingCallsWithDifferentObjects_Fails() {
        let obj1 = custom(prop: "propVal")
        let obj2 = custom(prop: "otherVal")
        let sut = CallVerifier()

        sut.record("call", obj1)
        let response = sut.verify("call", obj2)

        XCTAssertFalse(response)
    }

    func test_VerifyingCallsWithEquivalentObjects_Passes() {
        let obj1 = custom(prop: "propVal")
        let obj2 = custom(prop: "propVal")
        let sut = CallVerifier()

        sut.record("call", obj1)
        let response = sut.verify("call", obj2)

        XCTAssertTrue(response)
    }
}

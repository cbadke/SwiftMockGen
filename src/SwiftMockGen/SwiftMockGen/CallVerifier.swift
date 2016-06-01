//
//  CallVerifier.swift
//  SwiftMockGen
//
//  Created by Curtis Badke on 2016-06-01.
//  Copyright © 2016 DevFacto Technologies. All rights reserved.
//

import Foundation

class CallVerifier {

    private typealias CallRecord = (name: String, args: [AnyObject])
    private var calls: [CallRecord]

    init() {
        calls = [CallRecord]()
    }

    func Record (name: String, _ args: AnyObject...) {
        calls.append((name, args))
    }

    func Verify (name: String, _ args: AnyObject...) -> Bool {

        if args.count == 0 {
            return calls.contains( { (c) in c.name == name })
        }

        return calls.contains( { (c) in c.name == name && c.args.elementsEqual(args, isEquivalent: CompareAnyObject)
        })
    }


    //TODO: there is a glaring limitation to match objects here that I'm not sure how to overcome right now
    private func CompareAnyObject (lhs: AnyObject, rhs: AnyObject) -> Bool {
//        guard let l = lhs.description, r = rhs.description else {
//            return lhs === rhs }
//
//        return l == r
        return lhs === rhs
    }
}
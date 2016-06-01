//
//  CallVerifier.swift
//  SwiftMockGen
//
//  Created by Curtis Badke on 2016-06-01.
//  Copyright © 2016 DevFacto Technologies. All rights reserved.
//

import Foundation

class CallVerifier {

    private typealias CallRecord = (name: String, args: [CustomStringConvertible])
    private var calls: [CallRecord]

    init() {
        calls = [CallRecord]()
    }

    func record (_ name: String, _ args: CustomStringConvertible...) {
        calls.append((name, args))
    }

    func verify (_ name: String, _ args: CustomStringConvertible...) -> Bool {

        if args.count == 0 {
            return calls.contains( { (c) in c.name == name })
        }

        return calls.contains( { (c) in c.name == name
                                     && c.args.elementsEqual(args, isEquivalent: isEquivalentStringConvertible)
        })
    }

    //TODO: there is a glaring limitation to match objects here that I'm not sure how to overcome right now
    //      current (probably bad) idea is to have code generator add CustomStringConvertible implementation
    //      as extension to each protocol being mocked.
    private func isEquivalentStringConvertible (lhs: CustomStringConvertible, rhs: CustomStringConvertible) -> Bool {
        return lhs.description == rhs.description
    }
}
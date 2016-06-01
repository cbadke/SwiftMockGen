//
//  Verifiable.swift
//  SwiftMockGen
//
//  Created by Curtis Badke on 2016-06-01.
//  Copyright © 2016 DevFacto Technologies. All rights reserved.
//

import Foundation

protocol Verifiable {
    func verify (arg: AnyObject) -> Bool
}
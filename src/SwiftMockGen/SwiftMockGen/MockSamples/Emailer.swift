//
//  File.swift
//  SwiftMockGen
//
//  Created by Curtis Badke on 2016-06-01.
//  Copyright © 2016 DevFacto Technologies. All rights reserved.
//

import Foundation

protocol Emailer {
    func send (message: String, to recipient: Contact, from sender: Contact)
}
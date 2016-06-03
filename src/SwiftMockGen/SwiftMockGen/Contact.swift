//
//  Contact.swift
//  SwiftMockGen
//
//  Created by Curtis Badke on 2016-06-01.
//  Copyright © 2016 DevFacto Technologies. All rights reserved.
//

import Foundation

struct Contact {
    let firstName: String { get }
    let lastName: String { get }
    let email: String { get }

    init(firstName: String, lastName: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}
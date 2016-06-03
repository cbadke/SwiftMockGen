//
//  Contact.swift
//  SwiftMockGen
//
//  Created by Curtis Badke on 2016-06-01.
//  Copyright © 2016 DevFacto Technologies. All rights reserved.
//

import Foundation

struct Contact {
    let firstName: String
    let lastName: String
    let email: String

    init(firstName: String, lastName: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}
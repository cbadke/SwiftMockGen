//
//  mock+properties.swift
//  SwiftMockGen
//
//  Created by Curtis Badke on 2016-05-31.
//  Copyright © 2016 DevFacto Technologies. All rights reserved.
//

import Foundation

class MockProperties {
    
    func RegisterGet<T> (propertyName: String, value: T) {
        
    }

    func RegisterGet<T> (propertyName: String, callback: () -> T) {
        
    }
    
    func RegisterSet (propertyName: String) {
        
    }
    
    func RegisterSet<T> (propertyName: String, callback: (T) -> ()) {
        
    }
    
    func RecordGet<T> (propertyName: String) -> T {
        
    }
    
    func RecordSet<T> (propertyName: String, value: T) {
        
    }
    
    func VerifyGet (propertyName: String) -> Bool {
        return false;
    }
    
    func VerifySet (propertyName: String) -> Bool {
        return false;
    }
    
    func VerifySet<T> (propertyName: String, value: T) -> Bool {
        return false;
    }
}

//
//  Order.swift
//  CupcakeCorner
//
//  Created by Amr El-Fiqi on 04/02/2025.
//

import Foundation
import SwiftUI

@Observable
class Order {
    // Cake Details
    static let types = ["Vanilla", "Chocolate", "Strawberry", "Red Velvet", "Carrot Cake"]
    
    var type = 0
    var quantity = 3
    
    // Order Address
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        else {
            return true
        }
    }
    
    
    // Special Requests
    var specialRequestsEnabled = false {
        didSet {
            if !specialRequestsEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
}


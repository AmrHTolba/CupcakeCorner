//
//  Order.swift
//  CupcakeCorner
//
//  Created by Amr El-Fiqi on 04/02/2025.
//

import Foundation
import SwiftUI

@Observable
class Order: Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _name = "name"
        case _streetAddress = "streetAddress"
        case _city = "city"
        case _zip = "zip"
        case _specialRequestsEnabled = "specialRequestsEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
    }
    
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
    
    
    // Cost Calculatin
    var total: Decimal {
        var cost  = Decimal(quantity) * 2
        
        // Extra cost the more complicated it is
        cost += Decimal(type)/2
        
        // 1$
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        // 0.5$
        if addSprinkles {
            cost += Decimal(quantity)/2
        }
        return cost
    }
}


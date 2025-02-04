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
    static let types = ["Vanilla", "Chocolate", "Strawberry", "Red Velvet", "Carrot Cake"]
    
    var type = 0
    var quantity = 3
    
    var specialRequest = false
    var extraFrosting = false
    var addSprinkles = false
    
}


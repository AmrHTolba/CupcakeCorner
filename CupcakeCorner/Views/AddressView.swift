//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Amr El-Fiqi on 04/02/2025.
//

import SwiftUI

struct AddressView: View {
    
    var order: Order
    
    var body: some View {
        NavigationStack {
            Form {
                Text("Hm")
            }
            .navigationTitle("Address Details")
        }
    }
}

#Preview {
    AddressView(order: Order())
}

//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Amr El-Fiqi on 04/02/2025.
//

import SwiftUI

struct AddressView: View {
    
    @Bindable var order: Order
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $order.name)
                    TextField("Street address", text: $order.streetAddress)
                    TextField("City", text: $order.city)
                    TextField("ZIP Code", text: $order.zip)
                }
                
                Section{
                    NavigationLink("Checkout") {
                        CheckoutView(order: order)
                    }
                }
            }
            .navigationTitle("Delivery address")
        }
    }
}

#Preview {
    AddressView(order: Order())
}

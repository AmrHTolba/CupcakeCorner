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
                        .validate($order.name, type: .name)
                    TextField("Street address", text: $order.streetAddress)
                        .validate($order.streetAddress, type: .streetAddress)
                    TextField("City", text: $order.city)
                        .validate($order.city, type: .city)
                    TextField("ZIP Code", text: $order.zip)
                        .validate($order.zip, type: .zipCode)
                }
                
                Section{
                        NavigationLink("Checkout") {
                            CheckoutView(order: order)
                        }.disabled(!order.hasValidAddress)
                }
            }
            .navigationTitle("Delivery address")
        }
    }
}

#Preview {
    AddressView(order: Order())
}

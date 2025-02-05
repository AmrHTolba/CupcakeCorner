//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Amr El-Fiqi on 03/02/2025.
//

import SwiftUI


struct ContentView: View {
    
    // MARK: - Properties
    
    @State private var order = Order()
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes (2$/Pc): \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Special requests enabled?", isOn: $order.specialRequestsEnabled)
                    if order.specialRequestsEnabled {
                        Toggle("Extra Frosting (1$/Pc)", isOn: $order.extraFrosting)
                        Toggle("Add Sprinkles (0.5$/Pc)", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Address Details") {
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}

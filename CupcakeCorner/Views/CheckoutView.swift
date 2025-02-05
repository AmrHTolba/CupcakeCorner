//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Amr El-Fiqi on 04/02/2025.
//

import SwiftUI

struct CheckoutView: View {
    
    // MARK: - Properties
    var order: Order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                        image
                            .resizable()
                            .scaledToFit()
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 233)
                    Text("Order Summary")
                        .font(.title)
                    
                    Text("\(order.quantity) \(Order.types[order.type]) cupcakes \nExtra Frosting? \(order.extraFrosting ? "Yes" : "No") \nAdd Sprinkles? \(order.addSprinkles ? "Yes" : "No") ")
                        .font(.system(size: 20))
                        .padding(.horizontal, 4)
                    
                    Button("Place order") {
                        Task {
                            await placeOrder()
                        }
                    }
                        .padding()
                }
            }
            .scrollBounceBehavior(.basedOnSize)
            .navigationTitle("Check out")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Attention!", isPresented: $showingConfirmation) {
                Button("Ok") {}
            } message: {
                Text(confirmationMessage)
            }
        }
    }
    
    // MARK: - Methods
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("hi")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue( "application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "Post"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order has been placed!"
            showingConfirmation = true
        } catch {
            confirmationMessage = "Check out failed: \(error.localizedDescription)"
            showingConfirmation = true
        }
        
    }
    
    
}

#Preview {
    CheckoutView(order: Order())
}

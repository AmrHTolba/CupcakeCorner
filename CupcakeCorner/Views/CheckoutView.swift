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
                    
                    Text("Your total is \(order.total, format: .currency(code: "USD"))")
                        .font(.title)
                    
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
            .alert("Thank You!", isPresented: $showingConfirmation) {
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
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order \(decodedOrder.quantity) \(Order.types[decodedOrder.type].lowercased()) cupcakes with a total price of \(decodedOrder.total)$ has been placed!"
            showingConfirmation = true
        } catch {
            print("Check out failed: \(error.localizedDescription)")
        }
        
    }
    
    
}

#Preview {
    CheckoutView(order: Order())
}

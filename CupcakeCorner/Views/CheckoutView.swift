//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Amr El-Fiqi on 04/02/2025.
//

import SwiftUI

struct CheckoutView: View {
    
    var order: Order
    
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
                    
                    Button("Place order", action: {})
                        .padding()
                }
            }
            .scrollBounceBehavior(.basedOnSize)
            .navigationTitle("Check out")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}

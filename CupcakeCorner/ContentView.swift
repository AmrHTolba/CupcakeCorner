//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Amr El-Fiqi on 03/02/2025.
//

import SwiftUI

struct Response: Codable {
    var results : [Result]
}

struct Result: Codable {
    let trackId: Int
    let trackName: String
    let collectionName: String
}

struct ContentView: View {
    
    @State private var results = [Result]()
    @State private var userName = ""
    @State private var email = ""
    var disabledForm: Bool {
        userName.count < 5 || email.count < 5
    }
    
    var body: some View {
        
        Form {
            Section {
                TextField("Enter Username", text: $userName)
                TextField("Enter Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("creating account")
                }
            }
            .disabled(disabledForm)
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
        
        
    }
}

#Preview {
    ContentView()
}

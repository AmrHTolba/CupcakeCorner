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
    
    var body: some View {
        
        List(results, id: \.trackId) { item in
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Text("There was an error loading the pic")
                } else {
                    ProgressView()
                }
            }
            .frame(width: 200, height: 200)
            
            VStack(alignment: .leading) {
                Text(item.trackName)
            }
        }
        .listStyle(.plain)
        .task {
            await loadData()
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

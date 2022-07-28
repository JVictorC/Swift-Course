//
//  ContentView.swift
//  H4XOR News
//
//  Created by Joao Victor on 25/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text("\(post.points)")
                            Text(post.title)
                            
                        }
                    }
                )
            }.navigationTitle("H$X0R News")
        }
        .onAppear { networkManager.fetchData() }
        .safeAreaInset(edge: .bottom) {
            Color.clear
                .frame(height: 0)
                .background(Material.bar)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

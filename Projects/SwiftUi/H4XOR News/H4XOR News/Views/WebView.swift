//
//  WebView.swift
//  H4XOR News
//
//  Created by Joao Victor on 25/07/22.
//

import WebKit 
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let safeUrlString = urlString else {return}
        
        guard let url = URL(string: safeUrlString) else {return}
        
        let request = URLRequest(url: url)
        
        uiView.load(request)
    }
    
}

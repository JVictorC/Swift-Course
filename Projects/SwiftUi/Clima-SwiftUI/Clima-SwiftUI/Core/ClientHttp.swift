//
//  ClientHttp.swift
//  Clima-SwiftUI
//
//  Created by Joao Victor on 31/07/22.
//

import Foundation

protocol ClietHttpDelegate {
    func handleWithSuccessRequest(_: Data)
    
    func handleWithErrorRequest(_: Error)
}

final class ClientHttp {
    
    var delegate: ClietHttpDelegate?
    
    func get(with url: URL) {
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            if error != nil { self.delegate?.handleWithErrorRequest(error!) }
            
            guard let data = data else { return }
            
            
            self.delegate?.handleWithSuccessRequest(data)
        }
        task.resume()
    }
}

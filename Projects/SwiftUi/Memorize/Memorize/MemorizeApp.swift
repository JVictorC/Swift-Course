//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Joao Victo on 23/06/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: EmojiMemoryGame())
        }
    }
}

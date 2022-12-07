//
//  UIPasteboardApp.swift
//  UIPasteboard
//
//  Created by mark me on 11/12/22.
//

import SwiftUI

@main
struct UIPasteboardApp: App {
    
    @StateObject var vm = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}

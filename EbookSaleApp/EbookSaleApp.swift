//
//  EbookSaleApp.swift
//  EbookSaleApp
//
//  Created by Sagar Rathode   on 22/08/25.
//


import SwiftUI

@main
struct EbookSaleApp: App {
    @StateObject var cartVM = CartViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(cartVM)
        }
    }
}

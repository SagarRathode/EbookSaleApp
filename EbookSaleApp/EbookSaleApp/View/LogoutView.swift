//
//  LogoutView.swift
//  EbookSaleApp
//
//  Created by Sagar Rathode   on 22/08/25.
//


import SwiftUI

struct LogoutView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "arrow.right.square.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.red)
            Text("You have been logged out.")
                .font(.headline)
        }
        .padding()
        .navigationTitle("Logout")
    }
}

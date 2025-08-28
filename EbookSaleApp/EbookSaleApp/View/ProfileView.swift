//
//  ProfileView.swift
//  EbookSaleApp
//
//  Created by Sagar Rathode   on 22/08/25.
//


import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 120, height: 120)
                .foregroundColor(.blue)
            Text("User Name")
                .font(.title)
                .bold()
            Text("user@email.com")
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("Profile")
    }
}

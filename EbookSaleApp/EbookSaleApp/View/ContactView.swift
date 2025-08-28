//
//  ContactView.swift
//  EbookSaleApp
//
//  Created by Sagar Rathode   on 22/08/25.
//


import SwiftUI

struct ContactView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("📞 Contact Us")
                .font(.title)
                .bold()
            
            Text("Email: support@ebooks.com")
            Text("Phone: +91 98765 43210")
            Text("Address: Pune, India")
            
            Spacer()
        }
        .padding()
        .navigationTitle("Contact")
    }
}

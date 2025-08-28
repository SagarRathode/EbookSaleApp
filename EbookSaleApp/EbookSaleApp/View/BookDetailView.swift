//
//  BookDetailView.swift
//  EbookSaleApp
//
//  Created by Sagar Rathode   on 22/08/25.
//

import SwiftUI

struct BookDetailView: View {
    @EnvironmentObject var cartVM: CartViewModel
    let book: Ebook
    @State private var showAlert = false   // <-- Alert state
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                
                // Book cover
                Image(systemName: book.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 160)
                    .padding()
                    .background(
                        LinearGradient(colors: [Color.blue.opacity(0.2), Color.purple.opacity(0.2)],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                
                // Title & author
                VStack(spacing: 6) {
                    Text(book.title)
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                    Text("by \(book.author)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                // Description
                Text(book.description)
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                // Price
                Text("Price: ₹\(Int(book.price))")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.blue)
                
                // Add to Cart / Purchased Button
                if cartVM.purchasedBooks.contains(where: { $0.id == book.id }) {
                    NavigationLink(destination: ReaderView(book: book)) {
                        Text("Read Now")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                } else {
                    Button(action: {
                        cartVM.addToCart(book)
                        showAlert = true   // <-- Trigger alert
                    }) {
                        Text("Add to Cart")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                
                Spacer(minLength: 20)
            }
            .padding()
        }
        .navigationTitle("Book Details")
        .navigationBarTitleDisplayMode(.inline)
        .background(
            LinearGradient(colors: [Color.purple.opacity(0.05), Color.blue.opacity(0.05)],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
        )
        
                // Alert modifier
                .alert("Book Added", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text("\"\(book.title)\" has been added to your cart.")
                }
        
    }
}

#Preview {
    BookDetailView(book: Ebook(
        title: "SwiftUI Essentials",
        author: "Apple Inc.",
        price: 499,
        cover: "book.fill",
        description: "Learn SwiftUI from basics to advanced concepts.",
        fileName: "swiftui.pdf"
    ))
    .environmentObject(CartViewModel())
}

//
//  LibraryView.swift
//  EbookSaleApp
//
//  Created by Sagar Rathode   on 22/08/25.
//


import SwiftUI

struct LibraryView: View {
    
    @EnvironmentObject var cartVM: CartViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            if cartVM.purchasedBooks.isEmpty {
                VStack(spacing: 16) {
                    Image(systemName: "books.vertical")
                        .font(.system(size: 50))
                        .foregroundColor(.blue.opacity(0.7))
                    Text("No purchased books yet 📖")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text("Buy ebooks and they’ll appear here.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 100)
            } else {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(cartVM.purchasedBooks) { book in
                        NavigationLink {
                            ReaderView(book: book)
                        } label: {
                            LibraryCardView(book: book)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("My Library")
    }
}

// MARK: - Library Card
struct LibraryCardView: View {
    let book: Ebook
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: book.cover)
                .resizable()
                .scaledToFit()
                .frame(height: 90)
                .padding()
                .background(Color.green.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 14))
            
            Text(book.title)
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(maxWidth: .infinity)
            
            Text(book.author)
                .font(.caption)
                .foregroundColor(.secondary)
            
            Button(action: {}) {
                Text("Read Now")
                    .font(.subheadline)
                    .bold()
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .background(Color.blue.opacity(0.9))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            .padding(.top, 6)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(18)
        .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    LibraryView()
        .environmentObject(CartViewModel())
}


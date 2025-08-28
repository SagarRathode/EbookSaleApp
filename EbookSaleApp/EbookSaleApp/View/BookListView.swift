
//
//  View.swift
//  EbookSaleApp
//
//  Created by Sagar Rathode on 22/08/25.
//  BookListView.swift
//  EbookSaleApp
//

import SwiftUI

struct BookListView: View {
    @EnvironmentObject var cartVM: CartViewModel
    @State private var searchText = ""
    
    let books = [
        Ebook(title: "SwiftUI Essentials", author: "Apple Inc.", price: 499, cover: "book.fill", description: "Learn SwiftUI from basics to advanced concepts.", fileName: "swiftui.pdf"),
        Ebook(title: "Mastering iOS", author: "John Doe", price: 799, cover: "ipad.and.iphone", description: "Deep dive into iOS app development.", fileName: "ios.pdf"),
        Ebook(title: "Generative AI Guide", author: "Jane Smith", price: 599, cover: "brain.head.profile", description: "Introduction to AI and practical use cases.", fileName: "genai.pdf"),
        Ebook(title: "Data Structures in Swift", author: "Chris Lattner", price: 699, cover: "square.stack.3d.up.fill", description: "Implement algorithms and data structures using Swift.", fileName: "ds.pdf"),
        Ebook(title: "Modern Design Patterns", author: "Robert C. Martin", price: 899, cover: "pencil.and.outline", description: "Software architecture and design principles.", fileName: "designpatterns.pdf"),
        Ebook(title: "ARKit & RealityKit", author: "Tim Cook", price: 999, cover: "arkit", description: "Learn ARKit, RealityKit, and create immersive AR apps.", fileName: "arkit.pdf"),
        Ebook(title: "Metal Graphics", author: "Metal Team", price: 1299, cover: "cube.transparent", description: "High-performance GPU programming with Metal.", fileName: "metal.pdf"),
        Ebook(title: "Combine Framework", author: "Apple Dev Team", price: 499, cover: "waveform.path.ecg", description: "Reactive programming with Combine in Swift.", fileName: "combine.pdf"),
        Ebook(title: "Kotlin for Android", author: "Google Devs", price: 599, cover: "a.book.closed.fill.th", description: "Android development using Kotlin with Jetpack Compose.", fileName: "kotlin.pdf"),
        
        
        Ebook(title: "SwiftUI Essentials", author: "Apple Inc.", price: 499, cover: "book.fill", description: "Learn SwiftUI from basics to advanced concepts.", fileName: "swiftui.pdf"),
        Ebook(title: "Mastering iOS", author: "John Doe", price: 799, cover: "ipad.and.iphone", description: "Deep dive into iOS app development.", fileName: "ios.pdf"),
        Ebook(title: "Generative AI Guide", author: "Jane Smith", price: 599, cover: "brain.head.profile", description: "Introduction to AI and practical use cases.", fileName: "genai.pdf"),
        Ebook(title: "Data Structures in Swift", author: "Chris Lattner", price: 699, cover: "square.stack.3d.up.fill", description: "Implement algorithms and data structures using Swift.", fileName: "ds.pdf"),
        Ebook(title: "Modern Design Patterns", author: "Robert C. Martin", price: 899, cover: "pencil.and.outline", description: "Software architecture and design principles.", fileName: "designpatterns.pdf"),
        Ebook(title: "ARKit & RealityKit", author: "Tim Cook", price: 999, cover: "arkit", description: "Learn ARKit, RealityKit, and create immersive AR apps.", fileName: "arkit.pdf"),
        Ebook(title: "Metal Graphics", author: "Metal Team", price: 1299, cover: "cube.transparent", description: "High-performance GPU programming with Metal.", fileName: "metal.pdf"),
        Ebook(title: "Combine Framework", author: "Apple Dev Team", price: 499, cover: "waveform.path.ecg", description: "Reactive programming with Combine in Swift.", fileName: "combine.pdf"),
        Ebook(title: "Kotlin for Android", author: "Google Devs", price: 599, cover: "a.book.closed.fill.th", description: "Android development using Kotlin with Jetpack Compose.", fileName: "kotlin.pdf"),
        
        
        Ebook(title: "SwiftUI Essentials", author: "Apple Inc.", price: 499, cover: "book.fill", description: "Learn SwiftUI from basics to advanced concepts.", fileName: "swiftui.pdf"),
        Ebook(title: "Mastering iOS", author: "John Doe", price: 799, cover: "ipad.and.iphone", description: "Deep dive into iOS app development.", fileName: "ios.pdf"),
        Ebook(title: "Generative AI Guide", author: "Jane Smith", price: 599, cover: "brain.head.profile", description: "Introduction to AI and practical use cases.", fileName: "genai.pdf"),
        Ebook(title: "Data Structures in Swift", author: "Chris Lattner", price: 699, cover: "square.stack.3d.up.fill", description: "Implement algorithms and data structures using Swift.", fileName: "ds.pdf"),
        Ebook(title: "Modern Design Patterns", author: "Robert C. Martin", price: 899, cover: "pencil.and.outline", description: "Software architecture and design principles.", fileName: "designpatterns.pdf"),
        Ebook(title: "ARKit & RealityKit", author: "Tim Cook", price: 999, cover: "arkit", description: "Learn ARKit, RealityKit, and create immersive AR apps.", fileName: "arkit.pdf"),
        Ebook(title: "Metal Graphics", author: "Metal Team", price: 1299, cover: "cube.transparent", description: "High-performance GPU programming with Metal.", fileName: "metal.pdf"),
        Ebook(title: "Combine Framework", author: "Apple Dev Team", price: 499, cover: "waveform.path.ecg", description: "Reactive programming with Combine in Swift.", fileName: "combine.pdf"),
        Ebook(title: "Kotlin for Android", author: "Google Devs", price: 599, cover: "a.book.closed.fill.th", description: "Android development using Kotlin with Jetpack Compose.", fileName: "kotlin.pdf"),
        
        
        Ebook(title: "SwiftUI Essentials", author: "Apple Inc.", price: 499, cover: "book.fill", description: "Learn SwiftUI from basics to advanced concepts.", fileName: "swiftui.pdf"),
        Ebook(title: "Mastering iOS", author: "John Doe", price: 799, cover: "ipad.and.iphone", description: "Deep dive into iOS app development.", fileName: "ios.pdf"),
        Ebook(title: "Generative AI Guide", author: "Jane Smith", price: 599, cover: "brain.head.profile", description: "Introduction to AI and practical use cases.", fileName: "genai.pdf"),
        Ebook(title: "Data Structures in Swift", author: "Chris Lattner", price: 699, cover: "square.stack.3d.up.fill", description: "Implement algorithms and data structures using Swift.", fileName: "ds.pdf"),
        Ebook(title: "Modern Design Patterns", author: "Robert C. Martin", price: 899, cover: "pencil.and.outline", description: "Software architecture and design principles.", fileName: "designpatterns.pdf"),
        Ebook(title: "ARKit & RealityKit", author: "Tim Cook", price: 999, cover: "arkit", description: "Learn ARKit, RealityKit, and create immersive AR apps.", fileName: "arkit.pdf"),
        Ebook(title: "Metal Graphics", author: "Metal Team", price: 1299, cover: "cube.transparent", description: "High-performance GPU programming with Metal.", fileName: "metal.pdf"),
        Ebook(title: "Combine Framework", author: "Apple Dev Team", price: 499, cover: "waveform.path.ecg", description: "Reactive programming with Combine in Swift.", fileName: "combine.pdf"),
        Ebook(title: "Kotlin for Android", author: "Google Devs", price: 599, cover: "a.book.closed.fill.th", description: "Android development using Kotlin with Jetpack Compose.", fileName: "kotlin.pdf")
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var filteredBooks: [Ebook] {
        if searchText.isEmpty { books }
        else { books.filter { $0.title.localizedCaseInsensitiveContains(searchText) || $0.author.localizedCaseInsensitiveContains(searchText) } }
    }
    
//    var body: some View {
//        NavigationStack {
//            
//            // 🔹 Advertise Section
//            AdvertiseCarouselView()
//                .frame(height: 100)
//                .padding(.bottom, 10)
//            
//            ScrollView {
//                LazyVGrid(columns: columns, spacing: 20) {
//                    ForEach(filteredBooks) { book in
//                        NavigationLink(destination: BookDetailView(book: book).environmentObject(cartVM)) {
//                            BookCardView(book: book)
//                        }
//                        .buttonStyle(.plain)
//                    }
//                }
//                .padding()   // ✅ padding applied to grid, not to each link
//            }
//            .navigationTitle("📚 Ebook Store")
//            .toolbar {
//                ToolbarItemGroup(placement: .navigationBarTrailing) {
//                    // Cart Button
//                    NavigationLink(destination: CartView().environmentObject(cartVM)) {
//                        HStack {
//                            Image(systemName: "cart.fill")
//                            if cartVM.cart.count > 0 {
//                                Text("\(cartVM.cart.count)")
//                                    .font(.caption2)
//                                    .padding(4)
//                                    .background(Color.red)
//                                    .foregroundColor(.white)
//                                    .clipShape(Circle())
//                            }
//                        }
//                    }
//                    
//                    // Library Button
//                    NavigationLink(destination: LibraryView().environmentObject(cartVM)) {
//                        Image(systemName: "books.vertical.fill")
//                    }
//                }
//            }
//        }
//        
//
//
//            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search books")
//        }
//
    
    var body: some View {
            NavigationStack {
                ZStack(alignment: .top) {
                    
                    // 🔽 Scrollable content (books only)
                    ScrollView {
                        VStack(spacing: 0) {
                            // Spacer so content doesn't hide under banner
                            Color.clear.frame(height: 140)
                            
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(filteredBooks) { book in
                                    NavigationLink(destination: BookDetailView(book: book).environmentObject(cartVM)) {
                                        BookCardView(book: book)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding()
                        }
                    }
                    
                    // 🔽 Fixed Banner (always on top)
                    AdvertiseCarouselView()
                        .frame(height: 120)
                        .padding(.top, 8)
                        .background(Color(.systemBackground))
                        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                }
                .navigationTitle("📚 Ebook Store")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        
                        // 🛒 Cart Button
                        NavigationLink(destination: CartView().environmentObject(cartVM)) {
                            HStack {
                                Image(systemName: "cart.fill")
                                if cartVM.cart.count > 0 {
                                    Text("\(cartVM.cart.count)")
                                        .font(.caption2)
                                        .padding(4)
                                        .background(Color.red)
                                        .foregroundColor(.white)
                                        .clipShape(Circle())
                                }
                            }
                        }
                        
                        // 📖 Library Button
                        NavigationLink(destination: LibraryView().environmentObject(cartVM)) {
                            Image(systemName: "books.vertical.fill")
                        }
                    }
                }
            }
            .searchable(text: $searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "Search books")
        }
    
    
    }

// MARK: - Card View

struct BookCardView: View {
    let book: Ebook
    @State private var isPressed = false
    
    var body: some View {
        VStack(spacing: 10) {
            
            // 📖 Book cover placeholder
            ZStack(alignment: .topTrailing) {
                Image(systemName: book.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding(20)
                    .background(
                        LinearGradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)],
                                       startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                // 🔹 Bestseller / New Tag
                if Int.random(in: 0...5) > 3 {
                    Text("⭐ New")
                        .font(.caption2)
                        .padding(6)
                        .background(Color.yellow.opacity(0.9))
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                        .padding(6)
                }
            }
            
            // 📚 Book info
            VStack(spacing: 4) {
                Text(book.title)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                
                Text(book.author)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text("₹\(Int(book.price))")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
            }
            .padding(.horizontal, 4)
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)   // Glassy background
                .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)
        )
        .scaleEffect(isPressed ? 0.96 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in isPressed = false }
        )
    }
}




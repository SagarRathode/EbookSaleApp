import SwiftUI

struct MainView: View {
    @State private var showSidebar: Bool = false
    @State private var selection: SidebarMenu? = .store
    @EnvironmentObject var cartVM: CartViewModel
    
    
    
    let sampleBooks: [Ebook] = [
        Ebook(
            title: "SwiftUI Essentials",
            author: "Apple Inc.",
            price: 499,
            cover: "book.fill",
            description: "Learn SwiftUI from basics to advanced concepts.",
            fileName: "swiftui.pdf"
        ),
        Ebook(
            title: "Mastering iOS",
            author: "John Doe",
            price: 799,
            cover: "ipad.and.iphone",
            description: "Deep dive into iOS app development.",
            fileName: "ios.pdf"
        ),
        Ebook(
            title: "Generative AI Guide",
            author: "Jane Smith",
            price: 599,
            cover: "brain.head.profile",
            description: "Introduction to AI and practical use cases.",
            fileName: "genai.pdf"
        )
    ]

    
    var body: some View {
        ZStack {
            
            // Main content
            NavigationView {
                Group {
                    switch selection {
                    case .store:
                        VStack {
                            
                            // 🔹 Book List
                            BookListView()
                                .environmentObject(cartVM)
                        }
                        
                    case .library:
                        LibraryView()
                            .environmentObject(cartVM)
                        
                    case .profile:
                        ProfileView()
                        
                    case .orderHistory:
                            OrderHistoryView()
                    case .contact:
                        ContactView()
                        
                    case .logout:
                        LogoutView()
                        
                    case .none:
                        Text("Select a menu")
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            withAnimation {
                                showSidebar.toggle()
                            }
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .imageScale(.large)
                        }
                    }
                }
            }
            .disabled(showSidebar) // disable main view when sidebar open
            
            // Sidebar overlay
            if showSidebar {
                Color.black.opacity(0.3) // dim background
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            showSidebar = false
                        }
                    }
            }
            
            // Sidebar itself
            HStack {
                SidebarView(selection: $selection)
                    .frame(width: 250)
                    .background(Color(.systemBackground))
                    .offset(x: showSidebar ? 0 : -300)
                    .animation(.easeInOut(duration: 0.3), value: showSidebar)
                
                Spacer()
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(CartViewModel())
}

// MARK: - 🔹 Advertise Carousel
struct AdvertiseCarouselView: View {
    let offers = [
        "📚 Get 20% OFF on Bestsellers!",
        "🔥 Buy 1 Get 1 Free this Week!",
        "🚚 Free Delivery on Orders Above ₹500",
        "⭐ New Arrivals – Explore Now!",
        "💳 Extra 10% OFF with Credit Card"
    ]
    
    @State private var currentIndex = 0
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(offers.indices, id: \.self) { index in
                Text(offers[index])
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [.blue, .purple]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.horizontal, 10)
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .onReceive(timer) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % offers.count
            }
        }
    }
}


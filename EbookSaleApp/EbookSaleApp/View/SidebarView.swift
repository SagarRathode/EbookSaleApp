
//
//  SidebarMenu.swift
//  EbookSaleApp
//
//  Created by Sagar Rathode on 22/08/25.
//

import SwiftUI

struct SidebarView: View {
    @Binding var selection: SidebarMenu?
    
    var body: some View {
        ZStack {
            // Gradient Background
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.9), Color.purple.opacity(0.9)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                // App logo / header
                VStack {
                    Image(systemName: "book.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                    Text("E-Book Store")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(.top, 30)
                
                Divider()
                    .background(Color.white.opacity(0.5))
                
                // Menu items
                ForEach(SidebarMenu.allCases, id: \.self) { menu in
                    Button(action: {
                        selection = menu
                    }) {
                        HStack {
                            Image(systemName: menu.icon)
                                .frame(width: 24)
                            Text(menu.title)
                                .font(.system(size: 16, weight: .medium))
                            Spacer()
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 12)
                        .background(selection == menu ? Color.white.opacity(0.2) : Color.clear)
                        .cornerRadius(8)
                    }
                    .foregroundColor(selection == menu ? .yellow : .white)
                }
                
                Spacer()
            }
            .padding(.horizontal, 12)
            .padding(.top, 10)
        }
    }
}

enum SidebarMenu: CaseIterable {
    case store, library,orderHistory, profile, contact, logout
    
    var title: String {
        switch self {
        case .store: return "Store"
        case .library: return "Library"
        case .orderHistory: return "Order History"
        case .profile: return "Profile"
        case .contact: return "Contact"
        case .logout: return "Logout"
        }
    }
    
    var icon: String {
        switch self {
        case .store: return "cart.fill"
        case .library: return "books.vertical.fill"
        case .orderHistory: return "list.bullet.clipboard.fill"
        case .profile: return "person.crop.circle.fill"
        case .contact: return "envelope.fill"
        case .logout: return "arrow.backward.circle.fill"
        }
    }
}
#Preview {
    MainView()
        .environmentObject(CartViewModel())
}

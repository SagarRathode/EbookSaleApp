//
//  SidebarButton.swift
//  EbookSaleApp
//
//  Created by Sagar Rathode   on 22/08/25.
//

import SwiftUI
import SwiftUI

struct SidebarButton: View {
    var title: String
    var icon: String
    @Binding var selected: SidebarMenu?
    var menu: SidebarMenu
    
    var body: some View {
        Button(action: { selected = menu }) {
            HStack {
                Image(systemName: icon)
                Text(title)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(selected == menu ? Color.white.opacity(0.2) : Color.clear)
            .cornerRadius(8)
        }
        .foregroundColor(.white)
    }
}

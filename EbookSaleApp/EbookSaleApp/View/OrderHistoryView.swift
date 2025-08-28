//
//  OrderHistoryView.swift
//  EbookSaleApp
//
//  Created by Sagar Rathode   on 27/08/25.
//

import SwiftUI
struct OrderHistoryView: View {
    @EnvironmentObject var cartVM: CartViewModel

    var body: some View {
        List(cartVM.orders) { order in
            VStack(alignment: .leading) {
                Text(order.book.title)
                    .font(.headline)
                Text("Purchased on \(order.date.formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("My Orders")
    }
}

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartVM: CartViewModel
    @State private var goToPayment = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            if cartVM.cart.isEmpty {
                Spacer()
                Text("🛒 Cart is Empty")
                    .font(.headline)
                    .foregroundColor(.gray)
                Spacer()
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(cartVM.cart) { book in
                            VStack {
                                BookCardView(book: book)
                                
                                Button(action: {
                                    cartVM.removeFromCart(book: book)
                                }) {
                                    Text("Remove")
                                        .font(.caption)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 12)
                                        .background(Color.red.opacity(0.8))
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                                .padding(.top, 4)
                            }
                        }
                    }
                    .padding()
                }
                
                // Bottom total & checkout section
                VStack(spacing: 12) {
                    HStack {
                        Text("Total:")
                            .font(.headline)
                        Spacer()
                        Text("₹\(Int(cartVM.total))")   // ✅ now comes from VM
                            .bold()
                            .font(.headline)
                    }
                    
                    NavigationLink(destination: PaymentView()
                        .environmentObject(cartVM), isActive: $goToPayment) {
                        EmptyView()
                    }
                    
                    Button(action: {
                        cartVM.checkout()
                        goToPayment = true
                    }) {
                        Text("Proceed to Payment")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("My Cart")
    }
}

// MARK: - Preview
#Preview {
    NavigationView {
        CartView()
            .environmentObject(CartViewModel())
    }
}

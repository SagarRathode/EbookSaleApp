import Foundation
class CartViewModel: ObservableObject {
    @Published var cart: [Ebook] = []
    @Published var orders: [Order] = []
    
    var purchasedBooks: [Ebook] {
        orders.map { $0.book }
    }
    
    var total: Double {
        cart.reduce(0) { $0 + $1.price }
    }

    func addToCart(_ book: Ebook) {
        if !cart.contains(where: { $0.id == book.id }) {
            cart.append(book)
        }
    }

    func removeFromCart(book: Ebook) {
        cart.removeAll { $0.id == book.id }
    }

    func checkout() {
        for book in cart {
            let order = Order(book: book, date: Date())
            orders.append(order)
        }
        cart.removeAll()
    }
}

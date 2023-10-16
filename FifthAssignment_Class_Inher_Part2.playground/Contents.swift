 //პირველი თასქი - წიგნები

 // 1. Class Book
class Book {
    var bookID: Int
    var title: String
    var author: String
    var isBorrowed: Bool

    init(bookID: Int, title: String, author: String) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = false
    }

    func markAsBorrowed() {
        isBorrowed = true
    }

    func markAsReturned() {
        isBorrowed = false
    }
}

//2. Class Owner
class Owner {
    var ownerID: Int
    var name: String
    var borrowedBooks: [Book]

    init(ownerID: Int, name: String) {
        self.ownerID = ownerID
        self.name = name
        self.borrowedBooks = []
    }

    func borrowBook(_ book: Book) {
        if !book.isBorrowed {
            book.markAsBorrowed()
            borrowedBooks.append(book)
        }
    }

    func returnBook(_ book: Book) {
        if let index = borrowedBooks.firstIndex(where: { $0.bookID == book.bookID }) {
            book.markAsReturned()
            borrowedBooks.remove(at: index)
        }
    }
}

//3. Class Library

class Library {
    var books: [Book]
    var owners: [Owner]

    init() {
        self.books = []
        self.owners = []
    }

    func addBook(_ book: Book) {
        books.append(book)
    }

    func addOwner(_ owner: Owner) {
        owners.append(owner)
    }

    func availableBooks() -> [Book] {
        return books.filter { !$0.isBorrowed }
    }

    func borrowedBooks() -> [Book] {
        return books.filter { $0.isBorrowed }
    }

    func findOwnerByID(_ ownerID: Int) -> Owner? {
        return owners.first { $0.ownerID == ownerID }
    }

    func booksBorrowedByOwner(_ owner: Owner) -> [Book] {
        return owner.borrowedBooks
    }

    func allowOwnerToBorrowBook(_ owner: Owner, _ book: Book) {
        if !book.isBorrowed {
            owner.borrowBook(book)
        }
    }
}


// 4. Simulate Library    - ბიბლიოთეკის სიმულაციაში არ ვარ დარწმუნებული

let book1 = Book(bookID: 123456789, title: "გზაზე ერთი კაცი მიდიოდა", author: "ოთარ ჭილაძე")
let book2 = Book(bookID: 987654321, title: "ბრმა მკვლელი", author: "მარგარეტ ეტვუდი")
let book3 = Book(bookID: 192837465, title: "ბრილკა", author: "ნინო ხარატიშვილი")

let owner1 = Owner(ownerID: 1010236748329, name: "ნინი")
let owner2 = Owner(ownerID: 0102030498765, name: "ვანო")
let owner3 = Owner(ownerID: 0102053928474, name: "ლია")

let library = Library()

library.addBook(book1)
library.addBook(book2)
library.addBook(book3)

library.addOwner(owner1)
library.addOwner(owner2)
library.addOwner(owner3)

owner1.borrowBook(book1)
owner1.returnBook(book1)
owner2.borrowBook(book3)
owner2.returnBook(book1)
owner3.borrowBook(book2)

print("Available books in the library:")
for book in library.availableBooks() {
    print("Title: \(book.title), Author: \(book.author)")
}

print("\nBorrowed books in the library:")
for book in library.borrowedBooks() {
    print("Title: \(book.title), Author: \(book.author)")
}




// მეორე თასქი
//1. Class Product

class Product {
    let productID: Int
    let name: String
    let price: Double
    
    init(productID: Int, name: String, price: Double) {
        self.productID = productID
        self.name = name
        self.price = price
    }
}

//2. Class Cart

class Cart {
    let cartID: Int
    var items: [Product]
    
    init(cartID: Int) {
        self.cartID = cartID
        self.items = []
    }
    
    func addProduct(_ product: Product) {
        items.append(product)
    }
    
    func removeProduct(withID productID: Int) {
        items.removeAll { $0.productID == productID }
    }
    
    func calculateTotalPrice() -> Double {
        return items.reduce(0) { $0 + $1.price }
    }
}

//3. Class user
class User {
    let userID: Int
    let username: String
    let cart: Cart
    
    init(userID: Int, username: String) {
        self.userID = userID
        self.username = username
        self.cart = Cart(cartID: userID)
    }
    
    func addToCart(_ product: Product) {
        cart.addProduct(product)
    }
    
    func removeFromCart(withID productID: Int) {
        cart.removeProduct(withID: productID)
    }
    
    func checkout() -> Double {
        let totalPrice = cart.calculateTotalPrice()
        cart.items.removeAll()
        return totalPrice
    }
}

// 4. Simulation
let product1 = Product(productID: 1, name: "პირველი პროდუქტი", price: 10.0)
let product2 = Product(productID: 2, name: "მეორე პროდუქტი", price: 15.0)
let product3 = Product(productID: 3, name: "მესამე პროდუქტი", price: 5.0)


let user1 = User(userID: 0143234123095, username: "მარი")
let user2 = User(userID: 0223423478980, username: "ნინო")


user1.addToCart(product1)
user1.addToCart(product2)
user2.addToCart(product2)
user2.addToCart(product3)


print("\(user1.username)'s cart total price: $\(user1.cart.calculateTotalPrice())")
print("\(user2.username)'s cart total price: $\(user2.cart.calculateTotalPrice())")


let totalPriceUser1 = user1.checkout()
let totalPriceUser2 = user2.checkout()

print("\(user1.username) paid: $\(totalPriceUser1)")
print("\(user2.username) paid: $\(totalPriceUser2)")


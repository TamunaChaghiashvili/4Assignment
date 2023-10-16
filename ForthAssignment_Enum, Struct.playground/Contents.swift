//1. WeekDay

let today = DayOfWeek.Saturday
enum DayOfWeek {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

func checkDayType(day: DayOfWeek) {
    switch day {
    case .Monday, .Tuesday, .Wednesday, .Thursday, .Friday:
        print("\(day) is a workday.")
    case .Saturday, .Sunday:
        print("\(day) is a weekend.")
    }
}
checkDayType(day: today)


//2. Weather

let sunnyDay = Weather.Sunny(Celsius: 36)
let rainyDay = Weather.Rainy(Celsius: 7)
let snowyyDay = Weather.Snowy(Celsius: -5)
let cloudyDay = Weather.Cloudy(Celsius: 14)

enum Weather {
    case Sunny(Celsius: Double)
    case Cloudy(Celsius: Double)
    case Rainy(Celsius: Double)
    case Snowy(Celsius: Double)
}
func recommendationByWeather(for weather: Weather) {
    switch weather {
    case .Sunny(let temperature):
        if temperature >= 25 {
            print("It's sunny. Wear light clothing.")
        } else {
            print("It's sunny but not too hot. Wear comfortable clothing.")
        }
    case .Cloudy:
        print("It's cloudy. Dress in layers and take a jacket just in caes.")
        
    case .Rainy(let temperature):
        if temperature >= 15 {
            print("It's rainy and relatively warm. Wear a waterproof jacket.")
        } else {
            print("It's rainy and chilly. Wear a raincoat and waterproof boots.")
        }
    case .Snowy(let temperature):
        if temperature >= 0 {
            print("It's snowy but not freezing. Wear warm clothing.")
        } else {
            print("It's snowy and cold. Wear a heavy winter coat and snow boots.")
        }
    }
}
recommendationByWeather(for: sunnyDay)
recommendationByWeather(for: rainyDay)
recommendationByWeather(for: snowyyDay)
recommendationByWeather(for: cloudyDay)

//3. Books

struct BookStructure {
    let title: String
    let author: String
    let publicationYear: Int
    
    init(title: String, author: String, publicationYear: Int) {
            self.title = title
            self.author = author
            self.publicationYear = publicationYear
        }
}

//let Books = BookStructure (title: "dsfe", author: "ew3rqwe", publicationYear: 9) //- object properties
//Books.publicationYear

let books: [BookStructure] = [
    BookStructure(title: "გზაზე ერთი კაცი მიდიოდა", author: "ოთარ ჭილაძე", publicationYear: 1973),
    BookStructure(title: "ბრმა მკვლელი", author: "მარგარეტ ეტვუდი", publicationYear: 2000),
    BookStructure(title: "Body Keeps the Score", author: "Bessel van der Kolk", publicationYear: 2015),
    BookStructure(title: "Glucose Goddess Method", author: "Jessie Inchauspe", publicationYear: 2023),
    BookStructure(title: "The Myth of Normal", author: "Gabor Mate", publicationYear: 2022),
]

func printTheBookAndItsProperties(books: [BookStructure], year: Int) {
    for book in books {
        if book.publicationYear > year {
            print("Title: \(book.title), Author: \(book.author), Year: \(book.publicationYear)")
        }
    }
}

let yearToFilter = 1990
print("Books published after \(yearToFilter):")
printTheBookAndItsProperties(books: books, year: yearToFilter)



//4. BankAccount

struct BankAccount {
    var holderName: String
    var accountNumber: String
    var balance: Double

    init(holderName: String, accountNumber: String, balance: Double) {
        self.holderName = holderName
        self.accountNumber = accountNumber
        self.balance = balance
    }

    mutating func deposit(amount: Double) {
            if amount > 0 {
                balance += amount
                print("Deposited $\(amount). New balance: $\(balance)")
            } else {
                print("Invalid deposit amount.")
            }
        }
        
        mutating func withdraw(amount: Double) {
            if amount > 0 {
                if amount <= balance {
                    balance -= amount
                    print("Withdrawn $\(amount). New balance: $\(balance)")
                } else {
                    print("Insufficient amount of Moneyt. Your current - $\(balance).")
                }
            } else {
                print("Invalid withdrawal amount.")
            }
        }
    }

var myAccount = BankAccount(holderName: "Tamuna", accountNumber: "548819372810", balance: 2500.0)

myAccount.withdraw(amount: 300.0)
myAccount.deposit(amount: 500.0)
//myAccount.deposit(amount: -200.0)
myAccount.withdraw(amount: -3000.0)



//5. Songs

enum Genre {
    case HipHop
    case Rock
    case Pop
    case Jazz
    case Classical
    case Electronic
    case Metal
    case Country
}
//
struct Song {
    let title: String
    let artist: String
    let duration: Double
    let genre: Genre
    var description: String {
        return "\(title) by \(artist) - \(genre)"
    }
    lazy var publisher: String = "Default Publisher"
}

let playlist: [Song] = [
    Song(title: "Lose Yourselt", artist: "Eminem", duration: 3.0, genre: .HipHop),
    Song(title: "Pink Floyd", artist: "Another brick in the wall", duration: 5.27, genre: .Rock),
    Song(title: "Miley Cyrus", artist: "Flowers", duration: 2.8, genre: .Pop),
    Song(title: "Miles Devis", artist: "So What", duration: 11.7, genre: .Jazz),
    Song(title: "Chopin", artist: "QWalz", duration: 27.5, genre: .Classical),
    Song(title: "Daft Punk", artist: "One more Tine", duration: 8.88, genre: .Electronic),
]

func filterSongs(playlist: [Song], forGenre genre: Genre) -> [Song]{
    return playlist.filter { song in
        return song.genre == genre
    }
}

let selectedGenre = Genre.Rock
let selectedSongs = filterSongs(playlist: playlist, forGenre: selectedGenre)
print("Songs in the \(selectedGenre) genre:")
for song in selectedSongs {
    print(song.description)
}

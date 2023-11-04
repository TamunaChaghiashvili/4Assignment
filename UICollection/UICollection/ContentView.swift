import SwiftUI

struct Movie: Identifiable {
    let id = UUID()
    var title: String
    var isFavorite: Bool = false
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State var movies: [Movie] = [
        Movie(title: "Movie 1"),
        Movie(title: "Movie 2"),
        Movie(title: "Movie 3"),
    ]

    var body: some View {
        NavigationView {
            List(movies) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie, movies: $movies)) {
                    MovieCell(movie: movie)
                }
            }
            .navigationBarTitle("Home")
        }
    }
}

struct MovieCell: View {
    @State var movie: Movie

    var body: some View {
        HStack {
            Button(action: {
                movie.isFavorite.toggle()
            }) {
                Image(systemName: movie.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(movie.isFavorite ? .red : .gray)
            }
            Text(movie.title)
        }
    }
}

struct MovieDetailView: View {
    @State var movie: Movie
    @Binding var movies: [Movie]

    var body: some View {
        VStack {
            Button(action: {
                movie.isFavorite.toggle()
            }) {
                Image(systemName: movie.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(movie.isFavorite ? .red : .gray)
            }
            Text(movie.title)
        }
        .navigationBarTitle("Movie Detail")
    }
}

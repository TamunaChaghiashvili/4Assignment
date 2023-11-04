import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        SignInView()
    }
}

struct SignInView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isSignedIn = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: $username)
                    .padding()
                SecureField("Password", text: $password)
                    .padding()
                Button("Sign In") {
                    if !username.isEmpty && !password.isEmpty {
                        isSignedIn = true
                    }
                }
                .padding()
                if isSignedIn {
                    NavigationLink(destination: HomePageView(), label: { EmptyView() })
                }
            }
            .navigationTitle("Sign In")
        }
    }
}


struct HomePageView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Present Color Palette Page", destination: ColorPaletteView(paletteType: .buttonBackground))
                NavigationLink("Push Color Palette Page", destination: ColorPaletteView(paletteType: .homeButtons))
            }
            .navigationTitle("Home Page")
        }
    }
}

enum PaletteType {
    case homeButtons
    case buttonBackground
}

struct ColorPaletteView: View {
    let paletteType: PaletteType
    
    var body: some View {
        VStack {
            Text(paletteType == .homeButtons ? "Change Home Buttons Background Colors" : "Change Home Background Color")
                .font(.title)
                .padding()
            
            ColorButtonsStack(paletteType: paletteType)
        }
        .navigationTitle("Color Palette")
    }
}

struct ColorButtonsStack: View {
    let paletteType: PaletteType
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(Color.allColors, id: \.self) { color in
                Button(action: {
                    // Handle button tap event here
                    // You can change the background color accordingly
                }) {
                    Text("Color")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(color)
                        .cornerRadius(10)
                }
                .cornerRadius(10)
            }
        }
    }
}

extension Color {
    static var allColors: [Color] {
        return [.red, .blue, .green, .yellow, .orange, .purple]
    }
}


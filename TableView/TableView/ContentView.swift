import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    var title: String
    var image: UIImage?
}

struct MainViewController: View {
    @State private var items: [Item] = []
    @State private var isShowingAddView = false
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Favorites")) {
                    ForEach(items.filter {
                        searchText.isEmpty || $0.title.localizedCaseInsensitiveContains(searchText)
                    }) { item in
                        NavigationLink(destination: ItemDetailsViewController(item: item)) {
                            HStack {
                                Image(uiImage: item.image ?? UIImage(systemName: "photo")!)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(8)
                                Text(item.title)
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Favorites")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {
                    isShowingAddView = true
                }) {
                    Image(systemName: "plus")
                }
            )
        }
        .sheet(isPresented: $isShowingAddView) {
            AddNewItemToListViewController(items: $items)
        }
    }
}

struct AddNewItemToListViewController: View {
    @Binding var items: [Item]
    @State private var newItemTitle = ""
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            TextField("Enter item name", text: $newItemTitle)
                .padding()

            Button(action: {
                isShowingImagePicker = true
            }) {
                Text("Upload Image")
            }
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(selectedImage: $selectedImage, presentationMode: presentationMode)
            }

            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 200)
            }

            Button(action: {
                if !newItemTitle.isEmpty {
                    items.append(Item(title: newItemTitle, image: selectedImage))
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Save")
            }
        }
    }
}

struct ItemDetailsViewController: View {
    let item: Item

    var body: some View {
        VStack {
            Image(uiImage: item.image ?? UIImage(systemName: "photo")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)

            Text(item.title)
                .font(.title)
        }
        .navigationTitle("Item Details")
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    var presentationMode: Binding<PresentationMode>

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            MainViewController()
        }
    }
}


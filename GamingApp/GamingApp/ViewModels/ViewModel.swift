//
//  ViewModel.swift
//  GamingApp
//
//  Created by LMCM on 3/31/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var gamesInfo: [Game] = []
    func fetch() {
        guard let url = URL(string: "https://gamestream-api.herokuapp.com/api/games") else {
            print("Api Error")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Optional Error")
                return
            }
            // Convert to Json
            do {
                let gamesResult = try JSONDecoder().decode([Game].self, from: data)
                DispatchQueue.main.async {
                    self.gamesInfo = gamesResult
                }
            } catch { print(error) }
        }
        task.resume()
    }
}

// struct UrlImage: View {
//    let urlString: String
//    @State var data: Data?
//    var body: some View {
//        // Si hay data, procede
//        if let data = data, let uiImage = UIImage(data: data) {
//            Image(uiImage: uiImage)
//                .resizable()
//                .scaledToFill()
//                .frame(width: 130, height: 70)
//                .background(Color.gray)
//        } else { // Sino usamos una imagen de ejemplo
//           Image(systemName: "video")
//                .resizable()
//                .scaledToFill()
//                .frame(width: 130, height: 70)
//                .background(Color.gray)
//                .onAppear {
//                    fetchImageData()
//                }
//        }
//    }
//    private func fetchImageData() {
//        guard let url = URL(string: urlString) else { return }
//        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
//            self.data = data
//        }
//        task.resume()
//    }
// }

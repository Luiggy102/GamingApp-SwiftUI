//
//  Cards.swift
//  GamingApp
//
//  Created by LMCM on 3/28/22.
//

import SwiftUI

struct PreviewForCards: View {
    var body: some View {
        VStack {
            CategoriesCard(cateregoryName: "Fps", cateregoryImageName: "FPS")
            ImageCard(imageName: "Abzu")
        }
    }
}

struct Cards: View {
    @State var gameName: String
    var body: some View {
        VStack(spacing: 0) {
            Image(gameName)
                .resizable()
                .scaledToFill()
                .overlay(Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 42, height: 42, alignment: .center)
                    .foregroundColor(.white)
                )
            Text(gameName)
                .padding()
                .font(.headline)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
                .background(Color(red: 20/255, green: 40/255, blue: 69/255))
        }
    }
}

struct CategoriesCard: View {
    @State var cateregoryName: String
    @State var cateregoryImageName: String
    var body: some View {
        VStack {
            Image(cateregoryImageName)
                .resizable()
                .frame(width: 40, height: 40)
            Text(cateregoryName.uppercased())
                .bold()
                .foregroundColor(Color(red: 67/255, green: 254/255, blue: 193/255))
        }.frame(width: 200, height: 160)
                .background(Color(red: 20/255, green: 40/255, blue: 69/255))
                .cornerRadius(10)
    }
}

struct ImageCard: View {
    @State var imageName: String
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 200, height: 160)
        }
    }
}

struct UrlImage: View {
    let urlString: String
    @State var data: Data?
    var body: some View {
        // Si hay data, procede
        if let data = data, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
//                .frame(width: 130, height: 70)
                .background(Color.gray)
        } else { // Sino usamos una imagen de ejemplo
           Image(systemName: "video")
                .resizable()
                .scaledToFill()
                .frame(width: 130, height: 70)
                .background(Color.gray)
                .onAppear {
                    fetchImageData()
                }
        }
    }
    private func fetchImageData() {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}

struct Cards_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForCards()
            .preferredColorScheme(.dark)
    }
}

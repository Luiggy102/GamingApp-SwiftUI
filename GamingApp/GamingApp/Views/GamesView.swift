//
//  GamesView.swift
//  GamingApp
//
//  Created by LMCM on 4/7/22.
//

import SwiftUI

struct GamesView: View {
    @StateObject var viewModel = ViewModel()
    @State var gameViewIsActive: Bool = false
//    var title, studio, contentRaiting, publicationYear, welcomeDescription: String
//    var platforms, tags, galleryImages: [String]
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack {
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0)
                .ignoresSafeArea()
            VStack {
                Text("Games")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)
                Spacer()
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.gamesInfo, id: \.self) { game in
                            Button(action: {
                                print("Pulsado \(game.title)")
                                gameViewIsActive = true
                            }, label: {
                                UrlImage(urlString: game.galleryImages[1])
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle.init(cornerRadius: 4))
                                    .frame(width: 180, height: 120)
                            })
                        }
                    }
                }
                .padding()
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
            .preferredColorScheme(.dark)
    }
}

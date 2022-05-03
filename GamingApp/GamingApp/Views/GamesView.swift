//
//  GamesView.swift
//  GamingApp
//
//  Created by LMCM on 4/7/22.
//

import SwiftUI
import AVKit

struct GamesView: View {
    @StateObject var viewModel = ViewModel()
    @State var gameViewIsActive: Bool = false
    // MARK: - game vars
    @State var gameUrl: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var contentRaiting: String = ""
    @State var publicationYear: String = ""
    @State var welcomeDescription: String = ""
    @State var platforms: [String] = [""]
    @State var tags: [String] = [""]
    @State var galleryImages: [String] = [""]
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
                                gameUrl = game.videosUrls.mobile
                                title = game.title
                                studio = game.studio
                                contentRaiting = game.contentRaiting
                                publicationYear = game.publicationYear
                                welcomeDescription = game.welcomeDescription
                                platforms = game.platforms
                                tags = game.tags
                                galleryImages = game.galleryImages
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
                NavigationLink(
                    "",
                    destination: GameView(gameUrl: gameUrl,
                                          title: title,
                                          studio: studio,
                                          contentRaiting: contentRaiting,
                                          publicationYear: publicationYear,
                                          welcomeDescription: welcomeDescription,
                                          platforms: platforms,
                                          tags: tags,
                                          galleryImages: galleryImages),
                    isActive: $gameViewIsActive
                )
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

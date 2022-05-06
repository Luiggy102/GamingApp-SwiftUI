//
//  FavoritesView.swift
//  GamingApp
//
//  Created by LMCM on 5/6/22.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    @StateObject var allVideoGames = ViewModel()
    var body: some View {
        ZStack {
            Color.theme.backgroundColor.ignoresSafeArea()
            VStack {
                Text("Favorites")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)
                ScrollView {
                    ForEach(allVideoGames.gamesInfo, id: \.self) { game in
                        let player = AVPlayer(url: URL(string: game.videosUrls.mobile)!)
                        VStack(spacing: 0) {
                            VideoPlayer(player: player)
                                .frame(height: 200)
                            Text(game.title)
                                .padding()
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.theme.secondaryColor)
                                .clipShape(RoundedRectangle(
                                    cornerRadius: 3.0))
                        }
                    }
                }
                .padding(.bottom, 8)
            }
            .padding(.horizontal, 6)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .preferredColorScheme(.dark)
    }
}

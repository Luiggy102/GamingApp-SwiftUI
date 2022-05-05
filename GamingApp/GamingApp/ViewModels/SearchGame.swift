//
//  SearchGame.swift
//  GamingApp
//
//  Created by LMCM on 5/5/22.
//

import Foundation

final class SearchGame: ObservableObject {
    @Published var seachedGames: [Game] = []
    func search(_ gameName: String) {
        seachedGames.removeAll() // para remover contenido anterior, por precaución
        // configurar para que pueda tener espacios la búsqueda
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        // Se le agrega la busqueda sin espacios a la url
        // si no tiene nada se le pone Cuphead
        guard let url = URL(
            string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")"
        ) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let gamesResult = try JSONDecoder().decode(GameResults.self, from: data)
                DispatchQueue.main.async {
                    self.seachedGames = gamesResult.results
                }
            } catch { print(error) }
        }
        task.resume()
    }
}

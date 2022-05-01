//
//  ViewModel.swift
//  GamingApp
//
//  Created by LMCM on 3/31/22.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var gamesInfo: [Game] = []
    func fetch() {
        guard let url = URL(string: "https://gamestream-api.herokuapp.com/api/games") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
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

//
//  GameViewModel.swift
//  game-app
//
//  Created by Magistra Apta on 04/01/24.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var game: [Result] = []
    @Published var detail: DetailGameModel?
    
    @MainActor
    func getGameData() async throws{
        guard let url = URL(string: "https://api.rawg.io/api/games?token&key=f26f41e3c0074fa68c798b02bae584a0&page=1") else {
            throw URLError(.badURL)
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        
        let decodedData = try decoder.decode(GameModel.self, from: data)
        self.game = decodedData.results
    }
    
    func getDetailGame(id: Int) async {
        guard let url = URL(string: "https://api.rawg.io/api/games/\(id)?token&key=f26f41e3c0074fa68c798b02bae584a0&page=1") else {
            return
        }
        
        do{
            let urlRequest = URLRequest(url: url)
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decoder = JSONDecoder()
            
            let decodedData = try decoder.decode(DetailGameModel.self, from: data)
            self.detail = decodedData
        } catch {
            print("error getting data")
        }
    }
}

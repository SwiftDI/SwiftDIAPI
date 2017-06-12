import SwiftDIHLP

struct UseCases {
    static let playGame = PlayGame(repo: Config.gameRepository)
    static let fetchGames = FetchGames(repo: Config.gameRepository)
    static let fetchGameById = FetchGameById(repo: Config.gameRepository)
}

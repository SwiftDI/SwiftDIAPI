import Kitura
import LoggerAPI
import HeliumLogger
import SwiftDIHLP
import Foundation

final class GamesController {
    let gameRepository: GameRepository

    init(router: Router, gameRepository: GameRepository) {
        self.gameRepository = gameRepository
        createRoutes(router: router)
    }

    private func createRoutes(router: Router) {
        router.all("/games", middleware: BodyParser())
        router.get("/games", handler: index)
        router.get("/games/:gameId", handler: show)
        router.post("/games", handler: create)
        router.delete("/games", handler: destroyAll)
    }

    private func index(request: RouterRequest, response: RouterResponse, next: () -> Void) throws {
        defer { next() }

        Log.info("GET /games")
        let fetchGames = FetchGames(repo: gameRepository)
        fetchGames.execute(observer: APIFetchGamesObserver(response: response))
    }

    private func show(request: RouterRequest, response: RouterResponse, next: () -> Void) throws {
        defer { next() }

        guard let id = request.parameters["gameId"], let uuid = UUID(uuidString: id) else {
            try response.status(.badRequest).end()
            return
        }

        Log.info("GET /games/\(uuid.uuidString)")
        let fetchGameById = FetchGameById(repo: gameRepository)
        fetchGameById.execute(id: uuid, observer: APIFetchGamesObserver(response: response))
    }

    private func create(request: RouterRequest, response: RouterResponse, next: () -> Void) throws {
        defer { next() }

        Log.info("POST /games")
        guard let values = request.body else {
            try response.status(.badRequest).end()
            return
        }

        guard case .json(let body) = values else {
            try response.status(.badRequest).end()
            return
        }

        if let p1 = body["p1"].string, let p2 = body["p2"].string {
            let playGame = PlayGame(repo: gameRepository)
            playGame.execute(p1: p1, p2: p2, observer: APIPlayGameObserver(response: response))
        }
    }

    private func destroyAll(request: RouterRequest, response: RouterResponse, next: () -> Void) throws {
        defer { next() }

        Log.info("DELETE /games")
        gameRepository.deleteAll()
        try response.status(.OK).end()
    }
}

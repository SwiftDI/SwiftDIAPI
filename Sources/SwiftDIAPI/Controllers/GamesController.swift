import Kitura
import LoggerAPI
import HeliumLogger
import SwiftDIHLP
import Foundation

final class GamesController {
    init(router: Router) {
        createRoutes(router: router)
    }

    private func createRoutes(router: Router) {
        router.all("/games", middleware: BodyParser())
        router.get("/games", handler: index)
        router.get("/games/:gameId", handler: show)
        router.post("/games", handler: create)
    }

    private func index(request: RouterRequest, response: RouterResponse, next: () -> Void) throws {
        defer { next() }

        Log.info("GET /games")
        UseCases.fetchGames.execute(observer: APIFetchGamesObserver(response: response))
    }

    private func show(request: RouterRequest, response: RouterResponse, next: () -> Void) throws {
        defer { next() }

        guard let id = request.parameters["gameId"], let uuid = UUID(uuidString: id) else {
            try response.status(.badRequest).end()
            return
        }

        Log.info("GET /games/\(uuid.uuidString)")
        UseCases.fetchGameById.execute(id: uuid, observer: APIFetchGamesObserver(response: response))
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
            UseCases.playGame.execute(p1: p1, p2: p2, observer: APIPlayGameObserver(response: response))
        }
    }
}

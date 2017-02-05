import Kitura
import LoggerAPI
import HeliumLogger
import SwiftDIWebRepositories

HeliumLogger.use()

let gameRepository = InMemoryGameRepository()

let router = Router()

let _ = GamesController(router: router, gameRepository: gameRepository)

Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()

import Kitura
import LoggerAPI
import HeliumLogger

HeliumLogger.use()

let router = Router()

let _ = GamesController(router: router)

Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()

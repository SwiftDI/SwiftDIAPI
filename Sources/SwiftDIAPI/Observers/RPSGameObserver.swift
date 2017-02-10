import SwiftDIHLP
import Kitura
import SwiftyJSON
import LoggerAPI

class RPSGameObserver: GameObserver {
    let response: RouterResponse

    init(response: RouterResponse) {
        self.response = response
    }

    func p1Wins(game: Game) {
        handleGameResponse(game: game)
    }

    func p2Wins(game: Game) {
        handleGameResponse(game: game)
    }

    func tie(game: Game) {
        handleGameResponse(game: game)
    }

    func invalidGame(game: Game) {
        handleGameResponse(game: game)
    }

    func handleGameResponse(game: Game) {
        response.status(.OK).send(json: JSON(game.toDict()))
    }
}

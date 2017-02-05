import SwiftDIHLP
import Kitura
import SwiftyJSON

class RPSGameHistoryObserver: GameHistoryObserver {
    let response: RouterResponse

    init(response: RouterResponse) {
        self.response = response
    }

    func fetched(games: [Game]) {
        response.status(.OK).send(json: JSON(games.map({$0.toDict()})))
    }

    func fetched(game: Game?) {
        if let game = game {
            response.status(.OK).send(json: JSON(game.toDict()))
        } else {
            response.status(.notFound)
        }
    }
}

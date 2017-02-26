import SwiftDIHLP
import Kitura
import SwiftyJSON

class APIFetchGamesObserver: FetchGamesObserver, FetchGameObserver {
    let response: RouterResponse

    init(response: RouterResponse) {
        self.response = response
    }

    func fetched(games: [Game]) {
        response.status(.OK).send(json: JSON(games.map({$0.toDict()})))
    }

    func fetched(game: Game) {
        response.status(.OK).send(json: JSON(game.toDict()))
    }

    func gameNotFound() {
        response.status(.notFound)
    }
}

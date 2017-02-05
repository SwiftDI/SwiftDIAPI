import SwiftDIHLP

class GamePresenter {
    let p1: String
    let p2: String
    let result: String

    init(game: Game) {
        self.p1 = game.p1
        self.p2 = game.p2
        self.result = game.result.display()
    }
}

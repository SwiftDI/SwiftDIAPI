import SwiftDIHLP
import SwiftDIWebRepositories

struct Config {
    static let gameRepository: GameRepository = InMemoryGameRepository()
}

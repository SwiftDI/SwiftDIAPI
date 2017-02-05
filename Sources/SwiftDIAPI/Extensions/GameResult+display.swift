import SwiftDIHLP

extension GameResult {
    func display() -> String {
        switch self {
        case .Invalid:
            return "Invalid Game"
        case .Tie:
            return "Tie Game"
        case .P1Wins:
            return "Player 1 Wins!"
        case .P2Wins:
            return "Player 2 Wins!"
        }
    }
}

import SwiftDIHLP
import Foundation

extension Game {
    func toDict() -> [String: String] {
        var dict = [
            "p1": self.p1,
            "p2": self.p2,
            "result": self.result.rawValue
        ]
        if let id = self.id {
            dict["id"] = id.uuidString
        }
        return dict
    }
}

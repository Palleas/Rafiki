import Foundation

struct Window {
    let number: Int
    let owner: String
}

extension Window: Equatable {
    static func ==(lhs: Window, rhs: Window) -> Bool {
        return lhs.number == rhs.number
            && lhs.owner == rhs.owner
    }
}

extension Window: Hashable {
    var hashValue: Int {
        return number.hashValue ^ owner.hashValue
    }
}

import Foundation

struct Space {
    
    let windows: [Window]
    
}

extension Space: Equatable {
    static func ==(lhs: Space, rhs: Space) -> Bool {
        return lhs.windows == rhs.windows
    }
}

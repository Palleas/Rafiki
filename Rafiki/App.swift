import Foundation

struct App {
    let name: String
}

extension App: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.name = value
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.name = value
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.name = value
    }
}

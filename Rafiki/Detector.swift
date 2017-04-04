import Foundation
import Quartz

final class Detector {
        private let apps: [App]
    
    init(apps: [App]) {
        self.apps = apps
    }
    
    func windows() -> [Window] {
        let options: CGWindowListOption = [.optionOnScreenOnly, .excludeDesktopElements]
        guard let copy = CGWindowListCopyWindowInfo(options, kCGNullWindowID) else { return [] }
        
        guard let windows = copy as? [[String: Any]] else { return [] }
        
        return windows
            .flatMap { dict in
                guard let ownerName = dict[kCGWindowOwnerName as String] as? String else { return nil }
                guard let number = dict[kCGWindowNumber as String] as? Int else { return nil }
                
                return Window(number: number, owner: ownerName)
            }
            .filter { apps.map({ $0.name }).contains($0.owner)  }
    }

}

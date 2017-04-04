import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    private let detector = Detector(apps: ["Xcode", "Atom"])
    private var spaces = [Space]()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let w = NSWorkspace.shared()
        
        w.notificationCenter.addObserver(forName: NSNotification.Name.NSWorkspaceActiveSpaceDidChange, object: w, queue: .main) { note in
            
            NSApp.activate(ignoringOtherApps: true)
            
            let windows = self.detector.windows()
            let newSpace = Space(windows: windows)
            
            if self.spaces.contains(newSpace) {
                print("We know this space!")
            } else {
                print("Cool, a new space!")
                self.spaces.append(newSpace)
            }
        }
    }

}


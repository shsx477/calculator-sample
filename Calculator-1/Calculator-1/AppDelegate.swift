import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = self.window ?? UIWindow(frame: UIScreen.main.bounds)
        if let win = self.window {
            win.rootViewController = ViewController()
            win.makeKeyAndVisible()
        }
        
        return true
    }
}

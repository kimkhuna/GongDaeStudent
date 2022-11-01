//
//  AppDelegate.swift
//  GongDaeStudent
//
//  Created by 김경훈 on 2022/07/21.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var firstVC: ViewController? = nil
    var registerVC: RegisterViewController? = nil
    var mainVC: MainViewController? = nil
    var loginVC: LoginViewController? = nil
    var mainSide: MainSideMenuNavigationController? = nil
    var sideVC: SideViewController? = nil
    var freeVC: FreeViewController? = nil
    var qnaVC: QnAViewController? = nil
    var findVC: FindViewController? = nil



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        return true
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


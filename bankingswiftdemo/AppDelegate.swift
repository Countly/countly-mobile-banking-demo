//
//  AppDelegate.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 6.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import CoreData
import Countly
import IQKeyboardManagerSwift
import SideMenu
import Toast_Swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Thread.sleep(forTimeInterval: 2.0)
        
        IQKeyboardManager.shared.enable = true

        let config: CountlyConfig = CountlyConfig()
        config.appKey = "7d45543c2e2989f99957c794647a96c73bb0cd13"
        config.host = "https://demo.count.ly"
        config.features = [CLYCrashReporting,CLYPushNotifications]
        config.enableDebug = false
        config.enableRemoteConfig = true
        //config.requiresConsent = true;
        config.updateSessionPeriod = 5 ;
        config.starRatingMessage = "Please rate our app?"
        config.pushTestMode = CLYPushTestModeTestFlightOrAdHoc
        Countly.sharedInstance().start(with: config)
        Countly.sharedInstance().askForNotificationPermission()

        
       
        
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

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "bankingswiftdemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

extension UIViewController {
    open override func awakeFromNib() {
        let backIcon = UIImage(named: "back")
        self.navigationController?.navigationBar.backIndicatorImage = backIcon
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backIcon
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.26, green: 0.29, blue: 0.32, alpha: 1.00)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let titleAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Inter", size: 15)!
           ]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
    }
}

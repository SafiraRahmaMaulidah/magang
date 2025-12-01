//
//  magangApp.swift
//  magang
//
//  Created by MacBook Pro M1 on 19/11/25.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    print("🔥 Firebase configured")
    return true
  }
}

@main
struct magangApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}

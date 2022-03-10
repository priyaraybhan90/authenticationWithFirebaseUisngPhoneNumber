//
//  AppDelegate.swift
//  FirsebaseAuthenticateUsingPhoneNumber
//
//  Created by Admin on 09/03/22.
//

import UIKit
import FirebaseCore
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        // Override point for customization after application launch.
        return true
    }



}


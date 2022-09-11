//
//  AppDelegate.swift
//  CoinCalculator
//
//  Created by jeonsangjun on 2018/01/31.
//  Copyright © 2018年 archive-asia. All rights reserved.
//

import UIKit
import PubNub

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var client: PubNub!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //MARK: Setup realtime Client
        self.client = BFCoinManager.shared.realtimeClient
        self.client.addListener(self)
        
        BFCoinManager.shared.start()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and
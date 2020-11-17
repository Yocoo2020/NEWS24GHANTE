//
//  AppDelegate+RealtimeAPI.swift
//  BFCoinManager
//
//  Created by jaeeun on 2018/01/31.
//  Copyright © 2018年 leejaeeun. All rights reserved.
//

import UIKit
import PubNub

extension AppDelegate : PNObjectEventListener {
    // Handle new message from one of channels on which client has been subscribed.
    func client(_ client: PubNub, didReceiveMessage message: PNMessageResult) {

        // Handle new message stored in message.data.message
        if message.data.channel != mess
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
        if message.data.channel != message.data.subscription {

            // Message has been received on channel group stored in message.data.subscription.
        }
        else {

            // Message has been received on channel stored in message.data.channel.
        }

        guard let dataMessage = message.data.message else {
            print("Received no message data.")
            return;
        }

        //print("Received message: \(dataMessage) on channel \(message.data.channel) " + "at \(message.data.timetoken)")
        
        //更新処理
        BFCoinManager.shared.realtimeDidReceiveMessage(dataMessage, channel:message.data.channel, timeToken:message.data.timetoken)
    }

    // New presence event handling.
    func
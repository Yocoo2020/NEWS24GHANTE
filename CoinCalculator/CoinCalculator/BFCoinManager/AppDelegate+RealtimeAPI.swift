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
    func client(_ client: PubNub, didReceivePresenceEvent event: PNPresenceEventResult) {

        // Handle presence event event.data.presenceEvent (one of: join, leave, timeout, state-change).
        if event.data.channel != event.data.subscription {

            // Presence event has been received on channel group stored in event.data.subscription.
        }
        else {

            // Presence event has been received on channel stored in event.data.channel.
        }


        guard let uuid = event.data.presence.uuid else {
            print("Received no uuid data.")
            return;
        }

        guard let state = event.data.presence.state else {
            print("Received no uuid state.")
            return;
        }

        if event.data.presenceEvent != "state-change" {

            print("\(uuid) \"\(event.data.presenceEvent)'ed\"\n" +
                "at: \(event.data.presence.timetoken) on \(event.data.channel) " +
                "(Occupancy: \(event.data.presence.occupancy))");
        }
        else {

            print("\(uuid) changed state at: " +
                "\(event.data.presence.timetoken) on \(event.data.channel) to:\n" +
                "\(state)");
        }
    }

    // Handle subscription status change.
    func client(_ client: PubNub, didReceive status: PNStatus) {

        if status.operation == .subscribeOperation {

            // Check whether received information about successful subscription or restore.
            if status.category == .PNConnectedCategory || status.category == .PNReconnectedCategory {

                let subscribeStatus: PNSubscribeStatus = status as! PNSubscribeStatus
                if subscribeStatus.category == .PNConnectedCategory {

                    // This is expected for a subscribe, this means there is no error or issue whatsoever.

                    // Select last object from list of channels and send message to it.
                    let targetChannel = client.channels().last!
                    client.publish("Hello from the PubNub Swift SDK", toChannel: targetChannel,
                                   compressed: false, withCompletion: { (publishStatus) -> Void in

                                    if !publishStatus.isError {

                                        // Message successfully published to specified channel.
                                    }
                                    else {

                                        /**
                                         Handle message publish error. Check 'category' property to find out
                                         possible reason because of which request did fail.
                                         Review 'errorData' property (which has PNE
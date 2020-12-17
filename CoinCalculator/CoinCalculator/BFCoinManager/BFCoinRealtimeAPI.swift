//
//  BFCoinRealtimeAPI.swift
//  BFCoinManager
//
//  Created by jaeeun on 2018/01/31.
//  Copyright © 2018年 leejaeeun. All rights reserved.
//

import Foundation
import PubNub

enum Channel : String {
    case market         = "lightning_board_snapshot_"
    case board          = "lightning_board_"
    case ticker         = "lightning_ticker_"
    case executions     = "lightning_executions_"
}

final class BFCoinRealtimeAPI : NSObject {
    
    internal var client: PubNub!
    
    init(_ client: PubNub) {
        super.init()
        self.client = client
    }
    
    static func setupClient() -> PubNub {
        
        let configuration = PNConfiguration(publishKey: "BFCoinMgr", subscribeKey: "sub-c-52a9ab50-291b-11e5-baaa-0619f8945a4f")
        configuration.stripMobilePayload = false
        return PubNub.clientWithConfiguration(configuration)
  
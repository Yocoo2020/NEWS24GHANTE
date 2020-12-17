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
        
        let configuration = PN
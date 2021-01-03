//
//  Execution.swift
//  BFCoinManager
//
//  Created by jaeeun on 2018/01/31.
//  Copyright © 2018年 leejaeeun. All rights reserved.
//

import Foundation

enum SideType : String {
    case buy    = "BUY"
    case sell   = "SELL"
}
/*
    "id": 39287,
    "side": "BUY",
    "price": 31690,
    "size": 27.04,
    "exec_date": "2015-07-08T02:43:34.823",
    "buy_child_order_acceptance_id": "JRF20150707-200203-452209",
    "sell_child_order_acceptance_id": "JRF20150708-024334-060234"
 */
struct Execution {
    var executionId :UInt64?
    var side :SideType?
    var price = 0
    var size  = 0.0
    var exeDate :Date?
    var buyChildOrderAcceptanceId :String?
    var sellChildOrderAcceptanceId :String?
    
    init(dictionary: Dictionary<String, Any>) {
        
        if let execution_id = dictionary["id"] as? UInt64 {
            self.executionId = execution_id
        }
        
        if let side = dictionary["side"] as? String {
            self.side = SideType(rawValue: side) ?? nil
        }
        
        if let price = dictionary["price"] as? Int {
            self.price = price
        }
        
        if let size = dictionary["size
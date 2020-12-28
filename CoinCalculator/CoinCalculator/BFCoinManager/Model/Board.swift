//
//  Board.swift
//  BFCoinManager
//
//  Created by jaeeun on 2018/01/31.
//  Copyright © 2018年 leejaeeun. All rights reserved.
//

import Foundation

/*
 {"mid_price": 33320,
 "bids": [{"price": 30000,
         "size": 0.1},
         {"price": 25570,
         "size": 3}],
 "asks": [{"price": 36640,
         "size": 5},
         {"price": 36700,
         "size": 1.2}]}
 */
struct Board {
    
    var midPrice = 0
    var bids = [Rate]()
    var asks = [Rate]()
    
    init(dictionary: Dictionary<String, Any>) {
        
        if let mid_price = dictionary["mid
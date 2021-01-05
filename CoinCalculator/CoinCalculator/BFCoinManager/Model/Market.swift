//
//  Market.swift
//  BFCoinManager
//
//  Created by jaeeun on 2018/01/31.
//  Copyright © 2018年 leejaeeun. All rights reserved.
//

import Foundation

/*
    [{ "product_code": "BTC_JPY" },
    { "product_code": "FX_BTC_JPY" },
    { "product_code": "ETH_BTC" },
    {
    "product_code": "BTCJPY28APR2017",
    "alias": "BTCJPY_MAT1WK"
    },
    {
    "product_code": "BTCJPY05MAY2017",
    "alias": "BTCJPY_MAT2WK"
    }]
 */
struct Market {
    var productCode :String?
    var alias :String?
    

//
//  BFCoinManager.swift
//  BFCoinManager
//
//  Created by jaeeun on 2018/01/30.
//  Copyright © 2018年 leejaeeun. All rights reserved.
//

import Foundation
import PubNub

protocol BFCoinManagerDataChanged : AnyObject {
    func coinDataDidLoad(_ context:BFContext)
    func coinDataChanged(channel: Channel, productCode: String, data:Any)
}

final class BFCoinManager {
    
    open private(set) var context         : BFContext
    
//    private var requestAPi                : BFCoinAPI
    open private(set) var realtimeApi     : BFCoinRealtimeAPI
    open private(set) var realtimeClient  : PubNub
    open var contextLoaded = false
    
    private var observers = Array<BFCoinManagerDataChanged>()
    
    
    //
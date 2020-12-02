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
    
    
    //var context : Dictionary?
    static let shared: BFCoinManager = BFCoinManager()
    
    private init() {
        
        //setup realtime client
//        self.requestAPi = BFCoinAPI()
        self.realtimeClient = BFCoinRealtimeAPI.setupClient()
        self.realtimeApi = BFCoinRealtimeAPI(self.realtimeClient)
        self.context = BFContext()
    }
    
    //MARK: Observer
    open func addObserver(_ observer: BFCoinManagerDataChanged) {
        for item in observers {
            if item === observer {
                return
            }
        }
        
        //登録する
        observers.append(observer)
    }
    
    open func removeObserver(_ observer: BFCoinManagerDataChanged) {
        
        for (index, item) in observers.enumerated() {
            if item === observer {
                //解除する
                observers.remove(at: index)
                break
            }
        }
    }
    
    open func removeAllObserver() {
        observers.removeAll()
    }
    
    private func loadNotification(_ ctx: BFContext) {
        
        for observer in observers {
            //通知する
            observer.coinDataDidLoad(ctx)
        }
        
    }
    
    private func realtimeNotification(channel:Channel, productCode: String, data: Any) {
        
        for observer in observers {
            //通知する
            observer.coinDataChanged(channel: channel, productCode: productCode, data: data)
        }
    }
    
    //MARK: Start
    func start() {
        
        self.keepAliveCountUp()
        
        //Request
        BFCoinAPI.requestMarket
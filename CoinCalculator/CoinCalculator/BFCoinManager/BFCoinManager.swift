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
    func coinDataDidLoad(_ context:
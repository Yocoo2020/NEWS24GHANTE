//
//  BoardState.swift
//  BFCoinManager
//
//  Created by jaeeun on 2018/01/31.
//  Copyright © 2018年 leejaeeun. All rights reserved.
//

import Foundation

enum HealthType: String {
    case normal      = "NORMAL"      //取引所は稼動しています。
    case busy        = "BUSY"        //取引所に負荷がかかっている状態です。
    case veryBusy    = "VERY BUSY"   //取引所の負荷が大きい状態です。
    case superBusy   = "SUPER BUSY"  //負荷が非
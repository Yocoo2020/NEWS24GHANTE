
//
//  CoinListCell.swift
//  CoinCalculator
//
//  Created by jeonsangjun on 2018/01/31.
//  Copyright © 2018年 archive-asia. All rights reserved.
//

import UIKit

class CoinListCell: UITableViewCell {
    
    var ticker: Ticker? {
        didSet {
            // TODO: Cellに値を設定
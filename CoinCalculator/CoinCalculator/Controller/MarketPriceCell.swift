//
//  MarketPriceCell.swift
//  CoinCalculator
//
//  Created by jeonsangjun on 2018/02/05.
//  Copyright © 2018年 archive-asia. All rights reserved.
//

import UIKit

class MarketPriceCell: UITableViewCell {
    
    var askRate: Rate? {
        didSet {
            if let askRate = askRate 
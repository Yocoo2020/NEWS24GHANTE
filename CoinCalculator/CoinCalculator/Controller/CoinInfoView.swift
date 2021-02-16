//
//  CoinInfoView.swift
//  CoinCalculator
//
//  Created by jeonsangjun on 2018/02/08.
//  Copyright © 2018年 archive-asia. All rights reserved.
//

import UIKit

class CoinInfoView: UIView {
    
    let fontSize: CGFloat = 17
    let fontName = ".SFUIText"
    
    var ticker: Ticker? {
        didSet {
            guard let ticker = ticker else {
                retu
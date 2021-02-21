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
                return
            }
            let bestBid = ticker.bestBid == 0 ? "-" : "\(ticker.bestBid)"
            bestBidLabel.text = bestBid
            let bestBidSize = ticker.bestBidSize == 0 ? "-" : "\(ticker.bestBidSize)"
            bestBid
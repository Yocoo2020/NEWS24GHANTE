
//
//  CalculatorBarView.swift
//  CoinCalculator
//
//  Created by jeonsangjun on 2018/02/14.
//  Copyright © 2018年 archive-asia. All rights reserved.
//

import UIKit

class CalculatorBarView: UIView {
    
    var coinName = ""
    var ltp: Int = 0
    var isExchangeOfYenForCoin = false
    
    var isKeyboardShowingByTappingView = false
    
    var ticker: Ticker? {
        didSet {
            if let ticker = ticker {
                if let productCode = ticker.productCode {
                    self.coinName = productCode.convertCodeToName()
                }
                self.ltp = ticker.ltp
            }
        }
    }
    
    @IBOutlet weak var currentExchangeModeLabel: UILabel!
    @IBOutlet weak var exchangedResultLabel: UILabel!
    @IBOutlet weak var inputValueTextField: UITextField!
    
    @IBAction func switchExchangeAction(_ sender: UIButton) {
        switchExchangeMode()
    }
    
    @IBAction func exchangeAction(_ sender: UIButton) {
        if isExchangeOfYenForCoin { // JPY -> BTC
            if let inputValueString = inputValueTextField.text {
                if let inputValueDouble = Double(inputValueString) {
                    let ltpDouble = Double(ltp)
                    let oneYen = 1 / ltpDouble
                    let exchangedValue = inputValueDouble * oneYen
                    let finalValue = String(format:"%.8f", exchangedValue)
                    exchangedResultLabel.text = finalValue
                }
            }
        } else {                    // BTC -> JPY
            if let inputValueString = inputValueTextField.text {
                if let inputValueDouble = Double(inputValueString) {
                    let ltpDouble = Double(ltp)
                    let exchangedValue = Int(inputValueDouble * ltpDouble)
                    
                    let numFormatter : NumberFormatter = NumberFormatter()
                    numFormatter.numberStyle = .decimal
                    let finalValue : String = numFormatter.string(from: NSNumber(value: exchangedValue))!
    
                    exchangedResultLabel.text = "\(finalValue) ￥"
                    
//
//  Date+Helper.swift
//  BFCoinManager
//
//  Created by jaeeun on 2018/02/03.
//  Copyright © 2018年 leejaeeun. All rights reserved.
//

import Foundation

extension Date {
    
    func dateString()-> String {
        //"2018-02-03T02:28:43.247"
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateForma

//
//  BFCoinAPI.swift
//  BFCoinAPI
//
//  Created by jaeeun on 2018/01/30.
//  Copyright © 2018年 leejaeeun. All rights reserved.
//

import Foundation
import Alamofire

/*
 API制限
 HTTP API は、以下のとおり呼出回数を制限いたします。
 Private API は 1 分間に約 200 回を上限とします。
 IP アドレスごとに 1 分間に約 500 回を上限とします。
 注文数量が 0.01 以下の注文を大量に発注するユーザーは、一時的に、発注できる注文数が 1 分間に約 10 回までに制限されることがあります。
 システムに負荷をかける目的での発注を繰り返していると当社が判断した場合は、API の使用が制限されることがあります。ご了承ください。
 */

final class BFCoinAPI {
    
    // ホスト名
    private static let host = "https://api.bitflyer.jp/v1"
    
    
    
    // 共通ヘッダー
    static let CommonHeaders:HTTPHeaders = [
        "Authorization": "",
        "Version": Bundle.main.infoDictionary!["CFBundleShortVersionString"]! as! String,
        "Accept": "application/json"
    ]
    
     //リクエスト処理の生成
    private class func createRequest(url:String, parameters: Parameters? = nil) -> Alamofire.DataRequest {
    
        var urlString = "\(host)\(url)"
        var count = 0
        if let paramDict = parameters {
            urlString.append("?")
            for (key, value) in paramDict {
                urlString.append("\(key)=\(value)")
                count = count + 1
                if (count < paramDict.count) {
                    urlString.append("&")
                }
            }
        }
        
        return Alamofire.request(urlString,
                    method:.get,
                    parameters: nil,
                    encoding: JSONEncoding.default,
                    headers: BFCoinAPI.CommonHeaders).validate()
    }
    
    
    
    //マーケットの一覧
    static func requestMarkets(_ completion: @escaping (Array<Market>) ->Void) -> Void {
        
        self.createRequest(url: "/markets", parameters: nil).responseJSON { response in
            
            if let data = response.result.value {
                print("Success with response")
                
                var markets = Array<Market>()
                for dict in data as! [[String:Any]] {
                    let market = Market(dictionary: dict)
                    //print(market)
                    markets.append(market)
                }
                
                completion(markets)
            
            }else{
                print("Error with response")
            }
        }
    }
    
    //板情報
    static func requestBoard(_ productCode: String?, completion: @escaping (Board)->Void) -> Void {
        
        var parameters:[String:Any]? = nil
        
        if let code = productCode {
            parameters = ["product_code":code]
        }
        
        self.createRequest(url: "/board", parameters: parameters).responseJSON { response in
            
            if let data = response.result.value {
                print("Success with response")
                
                guard let dict = data as? Dictionary<String,Any> else {
                    return
                }
                
                let board = Board(dictionary: dict)
                
                completion(board)
                
            }else{
                print("Error with response")
            }
        }
        
    }
    
    //Ticker
    static func requestTicker(_ productCode: String?, completion: @escaping (Ticker)->Void) -> Void {
        
        var parameters : [String:Any]? = nil
        if let code = productCode {
            parameters = ["product_code":code]
        }
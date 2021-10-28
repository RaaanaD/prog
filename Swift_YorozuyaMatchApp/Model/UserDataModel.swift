//
//  UserDataModel.swift
//  YorozuyaApp
//
//  Created by 台莉捺子 on 2021/09/03.
//

import Foundation

//比較可能なプロトコルに準拠させておく
struct UserDataModel:Equatable {
    
    let name:String?
    let cost:String?
    let pre:String?
    let job:String?
    let identity:String?
    let customer:String?
    let profile:String?
    let profileImageString:String?
    let uid:String?
    let quickWord:String?
    let meet:String?
    let date:Double?
    let onlineORNot:Bool?
    
    
}

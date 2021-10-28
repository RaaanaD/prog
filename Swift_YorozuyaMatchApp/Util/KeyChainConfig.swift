//
//  KeyChainConfig.swift
//  YorozuyaApp
//
//  Created by 台莉捺子 on 2021/09/03.
//

import Foundation
import KeychainSwift

class KeyChainConfig{
    
    //userdefults
    
    static func getKeyData(key:String)->String{
        
        let keychain = KeychainSwift()
        let keyString = keychain.get(key)
        return keyString!
        
    }
    
    
    static func setKeyData(value:[String:Any],key:String){
        
        let keychain = KeychainSwift()
        //配列をデータ化
        let archivedData = try! NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: false)
        keychain.set(archivedData, forKey:key)
    }
    
    
    static func getKeyArrayData(key:String)->[String:Any]{
    
        let keychain = KeychainSwift()
        let keyData = keychain.getData(key)
        if keyData != nil{
    
            let unarchivedObject = try!
                NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(keyData!)as![String:Any]
            return unarchivedObject
    
        }else{
            
            return [:]
        }
    }
    
    static func getKeyArrayListData(key:String)->[String]{
        
        let keychain = KeychainSwift()
        let keyData = keychain.getData(key)
        if keyData != nil{
    
            let unarchivedObject = try!
                NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(keyData!)as![String]
            return unarchivedObject
    
        }else{
            
            return []
        }
            
    }
    
    static func setKeyArrayData(value:[String],key:String){
        
        let keychain = KeychainSwift()
        //配列をデータ化
        let archivedData = try! NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: false)
        keychain.set(archivedData, forKey:key)
        
    }

    
}

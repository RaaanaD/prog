//
//  Message.swift
//  YorozuyaApp
//
//  Created by 台莉捺子 on 2021/09/19.
//

import Foundation
import MessageKit


struct Message:MessageType {
    
    //必須
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
    
    //必須ではない　オプション
    var userImagePath:String
    var date:TimeInterval
    var messageImageString:String
    
    
}

struct imageMediaItem:MediaItem {
    var url: URL?
    
    var image: UIImage?
    
    var placeholderImage: UIImage
    
    var size: CGSize
    
    init(image:UIImage){
        
        self.image = image
        self.size = CGSize(width: 240, height: 240)
        self.placeholderImage = UIImage()
        
    }
    
    
    
    init(imageURL:URL){
        
        self.url = imageURL
        self.size = CGSize(width: 240, height: 240)
        self.placeholderImage = UIImage()
        
    }
    
}

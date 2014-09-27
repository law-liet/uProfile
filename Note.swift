//
//  Note.swift
//  test
//
//  Created by L.LawLiet on 14-9-26.
//  Copyright (c) 2014年 Lalala. All rights reserved.
//

import UIKit

class Note: NSObject, NSCoding{
    
    var text: String?
    
    var photo: UIImage?
    
    override init() {
        super.init()
    }
    
    func setText(content: String){
        self.text = content
    }
    
    func setImage(image: UIImage){
        self.photo = image
    }
    
    private struct SerializationKeys {
        static let text = "text"
        static let photo = "photo"
    }
    
    func encodeWithCoder(coder: NSCoder) {
        if let theText = text {
            coder.encodeObject(theText, forKey: SerializationKeys.text)
        }
        if let thePhoto = photo {
            coder.encodeObject(thePhoto, forKey: SerializationKeys.photo)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObjectForKey(SerializationKeys.text) as? String
        photo = aDecoder.decodeObjectForKey(SerializationKeys.photo) as? UIImage
    }
}

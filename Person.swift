//
//  person.swift
//  test
//
//  Created by chuan on 9/26/14.
//  Copyright (c) 2014 Lalala. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding{
    
    let name: String
    var photo: UIImage?
    var tags: [String]
    var notes: [Note]
    
    init(name: String){
        self.name = name
        self.tags = [String]()
        self.notes = [Note]()
    }
    
    func set_photo (photo: UIImage){
        self.photo = photo
    }
    
    func add_note(content: String?, photo: UIImage?){
        var note = Note()
        self.notes.append(note)
        if let noteText = content {
            self.notes[self.notes.count - 1].setText(noteText)
        }
        if let noteImage = photo {
            self.notes[self.notes.count - 1].setImage(noteImage)
        }
    }
    
    func edit_note(noteID: Int, content: String?, photo: UIImage?)
    {
        if let noteText = content {
            self.notes[noteID].setText(noteText)
        }
        if let notePhoto = photo {
            self.notes[noteID].setImage(notePhoto)
        }
        
    }
    
    func delete_note(noteID: Int)
    {
        self.notes.removeAtIndex(noteID)
    }
    
    func add_tag(tag: String)
    {
        self.tags.append(tag)
    }
    
    func edit_tag(tagID: Int, content: String)
    {
        self.tags[tagID] = content
    }
    
    func delete_tag (tagID: Int)
    {
        self.tags.removeAtIndex(tagID)
    }
    

    private struct SerializationKeys {
        static let name = "name"
        static let photo = "photo"
        static let tags = "tags"
        static let notes = "notes"
    }

    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(name, forKey: SerializationKeys.name)
       
        if let thePhoto = photo {
            coder.encodeObject(thePhoto, forKey: SerializationKeys.photo)
        }
        
        coder.encodeObject(tags, forKey: SerializationKeys.tags)
        
        coder.encodeObject(notes, forKey: SerializationKeys.notes)
        
    }

    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey(SerializationKeys.name) as String
        photo = aDecoder.decodeObjectForKey(SerializationKeys.photo) as? UIImage
        tags = aDecoder.decodeObjectForKey(SerializationKeys.tags) as [String]
        
        let unarchivedNotes: AnyObject? = aDecoder.decodeObjectForKey(SerializationKeys.notes)
        
        if unarchivedNotes != nil {
            notes = aDecoder.decodeObjectForKey(SerializationKeys.notes) as [Note]
        }
        else
        {
            notes = [Note]()
        }
    }
    
}
//
//  ProfileManager.swift
//  test
//
//  Created by L.LawLiet on 14-9-26.
//  Copyright (c) 2014年 Lalala. All rights reserved.
//

import Foundation
import UIKit

class ProfileManager: NSObject {
    
    var people = [Person]()
    
    override init() {
        super.init()
        load()
    }
    
    lazy private var archivePath: String = {
        let fileManager = NSFileManager.defaultManager()
        
        let documentsDirectoryURLs = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as [NSURL]
        
        let archiveURL = documentsDirectoryURLs.first!.URLByAppendingPathComponent("PeopleProfile", isDirectory: false)
        
        return archiveURL.path!
    }()
    
    func save(){
         NSKeyedArchiver.archiveRootObject(people, toFile: archivePath)
    }
    
    private func load(){
        if NSFileManager.defaultManager().fileExistsAtPath(archivePath){
            let savedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath) as [Person]
            
            people += savedItems
        }
    }
    
    func add_person(name: String, photo: UIImage?, tag: String?, notePhoto: UIImage?, noteText: String?){
        var new_person = Person(name: name)
        if let thePhoto = photo {
            new_person.set_photo(thePhoto)
        }
        if let theTag = tag {
            new_person.add_tag(theTag)
        }
        new_person.add_note(noteText, photo: notePhoto)
        people.append(new_person)
        save()
    }
    
    func delete_person(personID: Int){
        people.removeAtIndex(personID)
        save()
    }
}
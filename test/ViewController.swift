//
//  ViewController.swift
//  test
//
//  Created by chuan on 9/25/14.
//  Copyright (c) 2014 Lalala. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    var profileManager = ProfileManager()

    @IBOutlet var myCollectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionview.delegate = self
        myCollectionview.dataSource = self
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
       
        let cell = myCollectionview.dequeueReusableCellWithReuseIdentifier("A", forIndexPath: indexPath) as ViewControllerCollectionViewCell
        
        cell.label.text = profileManager.people[indexPath.row].name
        return cell
    }

    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileManager.people.count;
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        let addItemController = segue.sourceViewController as addViewController
        if let name = addItemController.textField.text
        {
            profileManager.add_person(name, photo: nil, tag: nil, notePhoto: nil, noteText: nil)
            myCollectionview.reloadData()
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Content"{
            
        let cell = sender as ViewControllerCollectionViewCell
        let indexPath =  myCollectionview.indexPathForCell(cell)
        let row = indexPath?.row
        let dest = segue.destinationViewController as UINavigationController
        var myPersonVC = dest.visibleViewController as PersonViewController
        myPersonVC.title = profileManager.people[row!].name

        }
        
       
        
    }
    
  
}



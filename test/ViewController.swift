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
       
        let cell = myCollectionview.dequeueReusableCellWithReuseIdentifier("A", forIndexPath: indexPath) as UICollectionViewCell
        return cell
    }

    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
       
        
    }
    
  
  

}


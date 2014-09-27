//
//  addViewController.swift
//  test
//
//  Created by chuan on 9/26/14.
//  Copyright (c) 2014 Lalala. All rights reserved.
//

import UIKit

class addViewController: UIViewController {
    
    
    
    @IBOutlet var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func Cancel(sender: AnyObject) {
        self .dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}

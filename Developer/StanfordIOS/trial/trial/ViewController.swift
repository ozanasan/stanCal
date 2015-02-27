//
//  ViewController.swift
//  trial
//
//  Created by Ozan Asan on 25/02/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func change(sender: AnyObject) {
        c.text = "hehehehehehe"
    }

    @IBOutlet weak var c: UILabel!
}


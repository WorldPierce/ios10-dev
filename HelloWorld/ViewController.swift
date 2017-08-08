//
//  ViewController.swift
//  HelloooooooWorld
//
//  Created by Billy Pierce on 8/8/17.
//  Copyright © 2017 Billy Pierce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var welcomeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func welcomePressed(_ sender: Any) {
        titleImage.isHidden = false
        welcomeBtn.isHidden = true
        background.isHidden = false
    }

}


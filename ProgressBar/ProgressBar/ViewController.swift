//
//  ViewController.swift
//  ProgressBar
//
//  Created by Billy Pierce on 8/13/17.
//  Copyright © 2017 Billy Pierce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var progressBarView: ProgressBarView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    

    @IBAction func sliderMoved(_ sender: Any) {
        progressBarView.progress = CGFloat(slider.value)
    }

}


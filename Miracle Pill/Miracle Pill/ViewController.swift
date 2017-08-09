//
//  ViewController.swift
//  Miracle Pill
//
//  Created by Billy Pierce on 8/9/17.
//  Copyright © 2017 Billy Pierce. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    
    
    @IBOutlet weak var zip2: UILabel!
    @IBOutlet weak var zip1: UITextField!
    @IBOutlet weak var success: UIImageView!
    @IBOutlet weak var c1: UITextField!
    @IBOutlet weak var c2: UILabel!
    @IBOutlet weak var s: UILabel!
    @IBOutlet weak var ci2: UILabel!
    @IBOutlet weak var st2: UILabel!
    @IBOutlet weak var f2: UILabel!
    
    @IBOutlet weak var f1: UITextField!
    @IBOutlet weak var st1: UITextField!
    @IBOutlet weak var ci1: UITextField!
    
    @IBOutlet weak var b: UIButton!
    
    @IBOutlet weak var zipLabel: UILabel!
    let states = ["Alaska", "Arkansas", "Alabama", "Ohio", "West Virginia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func stateBtnPressed(_ sender: Any) {
        statePicker.isHidden = false
        zip1.isHidden = true
        zip2.isHidden = true
        c1.isHidden = true
        c2.isHidden = true
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    @IBAction func buyNowBtnClick(_ sender: Any) {
        //view.isHidden = true
        zip1.isHidden = true
        zip2.isHidden = true
        c1.isHidden = true
        c2.isHidden = true
        statePickerBtn.isHidden = true
        s.isHidden = true
        ci1.isHidden = true
        ci2.isHidden = true
        f2.isHidden = true
        f1.isHidden = true
        st1.isHidden = true
        st2.isHidden = true
        b.isHidden = true
        
        success.isHidden = false
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        zip1.isHidden = false
        zip2.isHidden = false
        c1.isHidden = false
        c2.isHidden = false
    }
}


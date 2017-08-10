//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Billy Pierce on 8/10/17.
//  Copyright © 2017 Billy Pierce. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var btnSound: AVAudioPlayer!
    
    

    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var outputLbl: NSLayoutConstraint!
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var runningNumber = ""
    var currentOperation = Operation.Empty
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundUrl)
            btnSound.prepareToPlay()
        } catch _ as NSError {
            
        }
        output.text = ""
        
    }
    
    @IBAction func numberPressed(sender: UIButton) {
        playSound()
        if sender.tag != -1 {
            runningNumber += "\(sender.tag)"
            output.text = runningNumber
        }
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        procressOperation(operation: .Divide)
    }
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        procressOperation(operation: .Multiply)
    }
    @IBAction func onSubtractPressed(sender: AnyObject) {
        procressOperation(operation: .Subtract)
    }
    @IBAction func onAddPressed(sender: AnyObject) {
        procressOperation(operation: .Add)
    }
    @IBAction func onEqualPressed(sender: AnyObject){
        procressOperation(operation: currentOperation)
    }
    
    @IBAction func clearBtnPressed(_ sender: Any) {
        playSound()
        runningNumber = ""
        currentOperation = Operation.Empty
        leftValStr = ""
        rightValStr = ""
        result = ""
        output.text = ""
    }
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
    }
    
    func procressOperation(operation: Operation) {
        if currentOperation != Operation.Empty {
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.Divide{
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                leftValStr = result
                output.text = result
            }
            currentOperation = operation
        } else {
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}


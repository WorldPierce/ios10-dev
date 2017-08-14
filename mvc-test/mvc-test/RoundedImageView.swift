//
//  RoundedImageView.swift
//  mvc-test
//
//  Created by Billy Pierce on 8/13/17.
//  Copyright © 2017 Billy Pierce. All rights reserved.
//

import UIKit

// all view manipulation in view folder
// Must "Add Class" to all resources using this!

class RoundedImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        self.layer.cornerRadius = 100.0
        self.clipsToBounds = true
    }
}

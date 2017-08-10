//
//  ViewController.swift
//  PageScrollView
//
//  Created by Billy Pierce on 8/10/17.
//  Copyright © 2017 Billy Pierce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            }
    //must add data in view did appear others coords will be 0
    override func viewDidAppear(_ animated: Bool) {
        var contentWidth: CGFloat = 0.0
        
        for x in 0...2 {
            
            //getting images
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            
            //getting center
            newX = scrollView.frame.size.width / 2 + scrollView.frame.size.width * CGFloat(x)
            contentWidth += newX
            
            //adding image to scrollView
            scrollView.addSubview(imageView)
            
            //setting image to center
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height/2) - 75, width: 150, height: 150)
        }
        
        scrollView.clipsToBounds = false
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
        
        //Allows scroll to occur outside scrollView's bounds!
        view.addGestureRecognizer(scrollView.panGestureRecognizer)

    }




}


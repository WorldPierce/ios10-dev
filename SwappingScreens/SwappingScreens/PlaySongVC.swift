//
//  PlaySongVC.swift
//  SwappingScreens
//
//  Created by Billy Pierce on 8/10/17.
//  Copyright © 2017 Billy Pierce. All rights reserved.
//

import UIKit

class PlaySongVC: UIViewController {

    @IBOutlet weak var songTitleLbl: UILabel!
    private var _selectedSong:String!
    var selectedSong : String {
        get {
            return _selectedSong
        } set {
            _selectedSong = newValue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        songTitleLbl.text = _selectedSong
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

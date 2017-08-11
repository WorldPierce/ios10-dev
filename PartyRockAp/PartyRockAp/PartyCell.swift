//
//  PartyCell.swift
//  PartyRockAp
//
//  Created by Billy Pierce on 8/11/17.
//  Copyright © 2017 Billy Pierce. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        
        
        // ! to unwrap since we hard coded
        let url = URL(string: partyRock.imageUrl)!
        
        //create an async thread
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                
            }
        }
    }

}

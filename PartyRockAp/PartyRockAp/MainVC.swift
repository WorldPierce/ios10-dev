//
//  ViewController.swift
//  PartyRockAp
//
//  Created by Billy Pierce on 8/11/17.
//  Copyright © 2017 Billy Pierce. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRockArr = [PartyRock]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageUrl: "http://i.ytimg.com/vi/SjmTFIHX1yo/maxresdefault.jpg", videoUrl: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SjmTFIHX1yo?list=PLtM4rw7sjPKXMOQgsDmhbnml9V5dRlNOp?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lights Out")
        
        let p2 = PartyRock(imageUrl: "http://www.billboard.com/files/styles/article_main_image/public/media/redfoo-press-2015-billboard-650.jpg", videoUrl: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/TrVLu9p65a0?list=PLtM4rw7sjPKUe0YW6Fmrp2FSU7RxkX-JA?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Where The Sun Goes Down")
        
        let p3 = PartyRock(imageUrl: "http://lastfm-img2.akamaized.net/i/u/ar0/a72862c52ae24dc7cd8aa74d3294b666", videoUrl: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/xGiBiHocSZM?list=PLtM4rw7sjPKUe0YW6Fmrp2FSU7RxkX-JA?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "New Thang")
        
        let p4 = PartyRock(imageUrl: "http://streamd.hitparade.ch/cdimages/redfoo-bring_out_the_bottles_s.jpg", videoUrl: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/BgUvPw0OdU0?list=PLtM4rw7sjPKUe0YW6Fmrp2FSU7RxkX-JA?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Bring Out The Bottles")
        
        let p5 = PartyRock(imageUrl: "http://www.youredm.com/wp-content/uploads/2014/02/Lets-Get-Ridiculous-Remix.jpg", videoUrl: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/1w9DiGlZksU?list=PLtM4rw7sjPKUe0YW6Fmrp2FSU7RxkX-JA?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lets Get Ridiculous")
        
        partyRockArr.append(p1)
        partyRockArr.append(p2)
        partyRockArr.append(p3)
        partyRockArr.append(p4)
        partyRockArr.append(p5)
        
        //need there for table communication
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            let partyRock = partyRockArr[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
            
        } else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRockArr.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRockArr[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
    

}


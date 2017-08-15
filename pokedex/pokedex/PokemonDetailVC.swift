//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Billy Pierce on 8/15/17.
//  Copyright © 2017 Billy Pierce. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    
    var pokemon: Pokemon!
    
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setting images and ID that we have set from from the click
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        pokedexIdLbl.text = "\(pokemon.pokedexId)"
        
        nameLbl.text = pokemon.name.capitalized
        
        
        pokemon.downloadPokemonDetails { 
            //here is called after network call is complete
            //print("downloading!!!!!!!!!!!")
            self.updateUI()
        }
    }
    
    func updateUI() {
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        if pokemon.nextEvoId == "" {
            nextEvoImg.isHidden = true
            evoLbl.text = "No Evolutions"
        } else {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvoId)
            let str = "Next Evolution: \(pokemon.nextEvoName) - LVL \(pokemon.nextEvoLvl)"
            evoLbl.text = str
        }
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        //navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }


}

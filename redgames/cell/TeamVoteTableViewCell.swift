//
//  TeamVoteTableViewCell.swift
//  redgames
//
//  Created by Raphael Ramos on 27/05/19.
//  Copyright © 2019 Powell Apps. All rights reserved.
//

import UIKit
import Nuke

class TeamVoteTableViewCell: UITableViewCell {

    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelNota: UILabel!
    @IBOutlet weak var labelQuantity: UILabel!
    
    func set(team: Team){
        self.labelName.text = team.name
        self.labelNota.text = "Nota: \(team.average)"
        self.labelQuantity.text = "\(team.quantity) votos"
        Nuke.loadImage(with: URL(string: team.logo)!, into: self.imageLogo)
    }

}

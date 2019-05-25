//
//  TeamTableViewCell.swift
//  redgames
//
//  Created by Raphael Ramos on 25/05/19.
//  Copyright © 2019 Powell Apps. All rights reserved.
//

import UIKit
import Nuke


class TeamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    func set(team: Team){
        Nuke.loadImage(with: URL(string: team.logo)!, into: imageLogo)
        labelName.text = team.name
        labelDescription.text = team.description
    }
    

}

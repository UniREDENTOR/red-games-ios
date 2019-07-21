//
//  RankingTableViewCell.swift
//  redgames
//
//  Created by Raphael Ramos on 25/05/19.
//  Copyright © 2019 Powell Apps. All rights reserved.
//

import UIKit
import Nuke

class RankingTableViewCell: UITableViewCell {

    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPoints: UILabel!
    @IBOutlet weak var labelPosition: UILabel!
    
    func set(ranking: Ranking){
        
        labelPosition.text = "\(ranking.position)"
        labelName.text = ranking.name
        labelPoints.text = "\(ranking.score)"
        Nuke.loadImage(with: URL(string: ranking.logo)!, into: imageLogo)
        imageLogo.layer.cornerRadius = imageLogo.frame.size.width / 2
        imageLogo.clipsToBounds = true
    }
  

}

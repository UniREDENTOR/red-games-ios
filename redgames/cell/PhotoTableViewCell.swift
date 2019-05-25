//
//  PhotoTableViewCell.swift
//  redgames
//
//  Created by Raphael Ramos on 25/05/19.
//  Copyright © 2019 Powell Apps. All rights reserved.
//

import UIKit
import Nuke

class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagePhoto: UIImageView!
    
    func set(photo: Photo){
        Nuke.loadImage(with: photo.getUrl(), into: imagePhoto)
    }

}

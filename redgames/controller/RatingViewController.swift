//
//  RatingViewController.swift
//  redgames
//
//  Created by Raphael Ramos on 27/05/19.
//  Copyright © 2019 Powell Apps. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController {
    
    @IBOutlet weak var cosmosStarRating: CosmosView!
    
    @IBOutlet weak var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentTextField.delegate = self
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
}

extension RatingViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing()
        return true
    }
}

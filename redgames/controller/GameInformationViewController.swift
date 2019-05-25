//
//  GameInformationViewController.swift
//  redgames
//
//  Created by Raphael Ramos on 25/05/19.
//  Copyright © 2019 Powell Apps. All rights reserved.
//

import UIKit
import Eureka

class GameInformationViewController: FormViewController {
    
    var game = Game()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section("Informações")
            <<< TextRow(){ row in
                row.title = "Nome"
                row.value = game.name
                row.disabled = true
            }
            <<< TextRow(){ row in
                row.title = "Data"
                row.value = game.date
                row.disabled = true
            }
            <<< TextRow(){ row in
                row.title = "Hora"
                row.value = game.time
                row.disabled = true
        }
            <<< TextRow(){ row in
                row.title = "Local"
                row.value = game.locale
                row.disabled = true
        }
            <<< TextAreaRow(){ row in
                row.title = "Descrição"
                row.value = game.description
                row.disabled = true
                row.textAreaHeight = .dynamic(initialTextViewHeight: 96)
            }
            <<< TextAreaRow(){ row in
                        row.title = "Informação"
                        row.value = game.information
                        row.disabled = true
                } <<< ButtonRow("Edital"){ row in
                    row.title = "Edital"
                    }.onCellSelection { [weak self] (cell, row) in
                        guard let url = URL(string: (self?.game.edital)!) else { return }
                        UIApplication.shared.open(url)
        }
        

        self.navigationController?.navigationBar.topItem?.title = game.name
    }
    



}

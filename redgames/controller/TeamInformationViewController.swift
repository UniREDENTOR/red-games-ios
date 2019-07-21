//
//  TeamInformationViewController.swift
//  redgames
//
//  Created by Raphael Ramos on 26/05/19.
//  Copyright © 2019 Powell Apps. All rights reserved.
//

import UIKit
import Eureka

class TeamInformationViewController: FormViewController {
    
    var team = Team()

    override func viewDidLoad() {
        super.viewDidLoad()

        form +++ Section(team.name)
            <<< TextRow(){ row in
                row.title = "Líder"
                row.value = team.leader
                row.disabled = true
            }
            <<< TextRow(){ row in
                row.title = "Participações"
                row.value = "\(team.participations)"
                row.disabled = true
            }
      
            <<< TextAreaRow(){ row in
                row.title = "Descrição"
                row.value = team.description
                row.disabled = true
                row.textAreaHeight = .dynamic(initialTextViewHeight: 96)
            }
            <<< TextAreaRow(){ row in
                row.title = "Integrantes"
                row.value = "\(team.members)"
                row.disabled = true
        }
    }
    


}

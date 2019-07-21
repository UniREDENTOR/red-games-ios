//
//  TeamVotationTableViewController.swift
//  redgames
//
//  Created by Raphael Ramos on 27/05/19.
//  Copyright © 2019 Powell Apps. All rights reserved.
//

import UIKit
import PopupDialog

class TeamVotationTableViewController: UITableViewController {
    
    var teams = [Team]()
    var id = 0 

    override func viewDidLoad() {
        super.viewDidLoad()
        RequestRest.getEventsTeams(eventId: id) { response in
            self.teams = response
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Times"
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamVoteCell", for: indexPath) as! TeamVoteTableViewCell
        cell.set(team: teams[indexPath.row])
        return cell
    }
    
    func showCustomDialog(team: Team) {
        
        // Create a custom view controller
        let ratingVC = RatingViewController(nibName: "RatingViewController", bundle: nil)
        
        // Create the dialog
        let popup = PopupDialog(viewController: ratingVC,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceDown,
                                tapGestureDismissal: true,
                                panGestureDismissal: false)
        
        // Create first button
        let buttonOne = CancelButton(title: "Cancelar", height: 60) {
          //  self.label.text = "You canceled the rating dialog"
        }
        
        // Create second button
        let buttonTwo = DefaultButton(title: "Avaliar", height: 60) {
            let deviceID = UIDevice.current.identifierForVendor?.uuidString

            RequestRest.postEvents(eventId: self.id, teamId: team.id, uuid: deviceID!, amount: Int(ratingVC.cosmosStarRating!.rating)) { response in
                let alert = UIAlertController(title: "Alerta", message: "Obrigado pelo voto! Você só pode votar uma vez!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
        
        }
        
        // Add buttons to dial!og
        popup.addButtons([buttonOne, buttonTwo])
        
        // Present dialog
        present(popup, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showCustomDialog(team: teams[indexPath.row])
    }

}

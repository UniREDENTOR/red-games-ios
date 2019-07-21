//
//  TeamTableViewController.swift
//  redgames
//
//  Created by Raphael Ramos on 25/05/19.
//  Copyright © 2019 Powell Apps. All rights reserved.
//

import UIKit

class TeamTableViewController: UITableViewController {

    var teams = [Team]()
    var eventId = 0
    
    func criaTimes(){
        teams.append(Team())
        teams.append(Team())
        teams.append(Team())
        teams.append(Team())
        teams.append(Team())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        RequestRest.getTeams(){ response in
            self.teams = response
            self.tableView.reloadData()
            self.tableView.tableFooterView = UIView()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Equipes 2019"
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamTableViewCell
        cell.set(team: teams[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "TeamInformationStory") as! TeamInformationViewController
        vc.team = teams[indexPath.row]
        show(vc, sender: nil)
    }
    

    

}

//
//  RepositoriesViewController.swift
//  GitHubAPI-Swift
//
//  Created by Stephen Kaylor on 11/1/20.
//  Copyright © 2020 Polian Shpatina. All rights reserved.
//

import UIKit

class RepositoriesViewController: UITableViewController {

    
    @IBOutlet weak var numberOfRepositoriesLabel: UILabel!
    
    var username = String()
    var repositryList: [RepositoryResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadRepos()
    }
    
    private func loadRepos() {
        
        let jsonUrlString = "https://api.github.com/users/\(username)/repos"
        
        guard let url = URL(string: jsonUrlString) else { return }
            
            URLSession.shared.dataTask(with: url, completionHandler: {[unowned self] data, response, error in
                if let error = error { print(error); return }
                do {
                    self.repositryList = try JSONDecoder().decode([RepositoryResponse].self, from: data!)
                    print(self.repositryList)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.numberOfRepositoriesLabel.text = String(self.repositryList.count)
                    }
                } catch {
                    print(error)
                }
            }).resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return repositryList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepCell", for: indexPath) as! RepositoriesViewCell

        let cellData = repositryList[indexPath.row]
        
        cell.nameLabel.text = cellData.name
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

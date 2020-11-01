//
//  CommitsViewController.swift
//  GitHubAPI-Swift
//
//  Created by Stephen Kaylor on 10/31/20.
//  Copyright © 2020 Polian Shpatina. All rights reserved.
//

import UIKit

class CommitsViewController: UITableViewController {

    @IBOutlet weak var numberOfCommitsLabel: UILabel!
    
    var demoData = ["First", "Second", "Third"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberOfCommitsLabel.text = "\(demoData.count)"
        
        guard let url = URL(string: "https://www.api.github.com/repos/polianshpatina/GitHubAPI-Swift/commits") else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in

          guard let data = data, error == nil else { return }

          print(NSString(data: data, encoding: String.Encoding.utf8.rawValue))
        }

        task.resume()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return demoData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CommitsViewCell

        let cellData = demoData[indexPath.row]
        
        cell.authorLabel.text = cellData
        cell.HashLabel.text = cellData
        cell.messageLabel.text = cellData
        
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

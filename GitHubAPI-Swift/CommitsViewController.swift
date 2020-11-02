//
//  CommitsViewController.swift
//  GitHubAPI-Swift
//
//  Created by Stephen Kaylor on 10/31/20.
//  Copyright © 2020 Polian Shpatina. All rights reserved.
//

import UIKit
import GithubAPI

class CommitsViewController: UITableViewController {

    @IBOutlet weak var numberOfCommitsLabel: UILabel!
    
    var username = String()
    var repositoryName = String()
    var commitsList: [CommitsResponse] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        loadCommits()
    }
    
    private func loadCommits() {
        
        let jsonUrlString = "https://api.github.com/repos/\(username)/\(repositoryName)/commits"
        
        guard let url = URL(string: jsonUrlString) else { return }
            
            URLSession.shared.dataTask(with: url, completionHandler: {[unowned self] data, response, error in
                if let error = error { print(error); return }
                do {
                    self.commitsList = try JSONDecoder().decode([CommitsResponse].self, from: data!)
                    print(self.commitsList)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.numberOfCommitsLabel.text = String(self.commitsList.count)
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
        return commitsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CommitsViewCell

        let cellData = commitsList[indexPath.row]
        
        cell.authorLabel.text = cellData.commit?.author?.name
        cell.HashLabel.text = cellData.sha
        cell.messageLabel.text = cellData.commit?.message
        
        return cell
    }
}

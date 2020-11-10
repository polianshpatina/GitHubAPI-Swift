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
    var repoName = String()
    
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        repoName = self.repositryList[indexPath.row].name!
        
        self.performSegue(withIdentifier: "reposToCommits", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "reposToCommits"
        {
            let vc = segue.destination as! CommitsViewController
            vc.username = username
            vc.repositoryName = repoName
        }
    }
}

//
//  ListViewController.swift
//  Homework2
//
//  Created by Dmitry Shashlov on 01/06/2018.
//  Copyright © 2018 AGIMA Education. All rights reserved.
//

import UIKit

private let cellIdentifier = "cellId"
private let showDetailSegueIdentifier = "showDetail"

/// Кон
class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Модуль 2"
        setupTableView()
        let usersPreperor = UserService()
        usersPreperor.loadUsers { [weak self] users in
            guard let self = self else { return }
            self.users = users
            self.tableView.reloadData()
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == showDetailSegueIdentifier, let detailViewController = segue.destination as? DetailViewController else { return }
        let index = sender as! IndexPath
        detailViewController.user = users[index.row]
    }
}

extension ListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = "\(user.name) \(user.lastName)"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension ListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: showDetailSegueIdentifier, sender: indexPath)
    }
}

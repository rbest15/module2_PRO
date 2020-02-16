//
//  DetailViewController.swift
//  Homework2
//
//  Created by Igor Vedeneev on 01/06/2018.
//  Copyright © 2018 AGIMA Education. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var user: User!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        userLabel.text = "\(user.name) \(user.lastName)"
        companyLabel.text = user.companyName
    }
}

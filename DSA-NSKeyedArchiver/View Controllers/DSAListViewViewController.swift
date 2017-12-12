//
//  DSAListViewViewController.swift
//  DSA-NSKeyedArchiver
//
//  Created by C4Q on 12/12/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class DSAListViewViewController: UIViewController {
        
        @IBOutlet weak var tableView: UITableView!
        
        @IBAction func addDSAItem(_ sender: UIBarButtonItem) {
            
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.tableView.delegate = self
            self.tableView.dataSource = self
            DataModel.shared.load() //loads our items/ data
            //print(DataModel.shared.documentsDirectory())
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
        
}
    
extension DSAListViewViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataModel.shared.getLists().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DSA Cell", for: indexPath)
        let dsaItem = DataModel.shared.getLists()[indexPath.row]
        cell.textLabel?.text = dsaItem.dsaTitle
        return cell
    }
}




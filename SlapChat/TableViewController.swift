//
//  TableViewController.swift
//  SlapChat
//
//  Created by Ian Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    var store = DataStore.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        self.store.fetchData()
        if self.store.messages.isEmpty {
        self.generateTestData()
        }
     
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.store.fetchData()
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.store.messages.count)
        return self.store.messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
        cell.textLabel?.text = store.messages[indexPath.row].content
        return cell
    }
    
    @IBAction func resortButton(_ sender: UIBarButtonItem) {
        let sortedMessages = self.store.messages.sorted { (message1, message2) in
            return message1.createdAt.timeIntervalSince1970 > message2.createdAt.timeIntervalSince1970
        }
        self.store.messages = sortedMessages
        self.tableView.reloadData()
    }
     func generateTestData() {
        self.store.generateTestData()
        self.store.saveContext()
        self.store.fetchData()
        tableView.reloadData()
 
    }
}

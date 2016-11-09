//
//  AddMessageViewController.swift
//  SlapChat
//
//  Created by Rama Milaneh on 11/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddMessageViewController: UIViewController {
    var store = DataStore.sharedInstance
    
    @IBOutlet weak var textFieldLabel: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let newMessage = NSEntityDescription.insertNewObject(forEntityName: "Message", into: store.persistentContainer.viewContext) as! Message
        newMessage.content = self.textFieldLabel.text!
        newMessage.createdAt = NSDate()
        store.saveContext()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

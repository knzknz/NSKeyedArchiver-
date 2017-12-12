//
//  EditListViewController.swift
//  DSA-NSKeyedArchiver
//
//  Created by C4Q on 12/12/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class EditListViewController: UIViewController {
    
    @IBOutlet weak var dsaTextField: UITextField!
    @IBOutlet weak var dsaTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        guard let dsaTitle = dsaTextField.text, let dsaDescription = dsaTextView.text else { return }
        if dsaTitle.isEmpty || dsaDescription.isEmpty {
            showAlert()
            return
        } else { //save
                let dsaItem = DSA.init(title: dsaTitle, description: dsaDescription)
                DataModel.shared.addDSAItemToList(dsaItem: dsaItem)
        }
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    private func showAlert() {
        //create message
        let alertController = UIAlertController(title: "Missing Fields", message: "Title and description are required", preferredStyle: .alert)
        //Add an action
        let okAlert = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAlert)
        present(alertController, animated: true, completion: nil)
    }
    

}

//
//  ViewController.swift
//  TestApp
//
//  Created by Gabriel Fernando Neira Bermudez on 30/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func didClickButton(_ sender: Any) {
        
        let username = textField.text ?? "";
        let vc = EmbeddingFlutterViewController()
        vc.route = String.init(format: "/home?user=%@", username)
        
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
    
}


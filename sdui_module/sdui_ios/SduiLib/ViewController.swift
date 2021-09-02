//
//  MainViewController.swift
//  SduiLib
//
//  Created by Gabriel Fernando Neira Bermudez on 1/09/21.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let controller = EmbeddingFlutterViewController()
        controller.route = "/home?user=Username"
        controller.view.frame = self.view.bounds
        self.view.addSubview(controller.view)
        self.addChild(controller)
        controller.didMove(toParent: self)
    }
    
}

//
//  MainViewController.swift
//  Runner
//
//  Created by Gabriel Fernando Neira Bermudez on 28/08/21.
//

import UIKit
import Flutter

class MainViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let controller = FlutterViewController(
              project: nil, initialRoute: "/home?user=Username", nibName: nil, bundle: nil)
        controller.view.frame = self.view.bounds
        self.view.addSubview(controller.view)
        self.addChild(controller)
        controller.didMove(toParent: self)

    }
    
}

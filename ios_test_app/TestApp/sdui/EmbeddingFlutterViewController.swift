//
//  EmbeddingFlutterViewController.swift
//  TestApp
//
//  Created by Gabriel Fernando Neira Bermudez on 31/08/21.
//

import UIKit
import Flutter

class EmbeddingFlutterViewController: UIViewController {

    var route : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let controller = FlutterViewController(
              project: nil, initialRoute: route ?? "", nibName: nil, bundle: nil)
        controller.view.frame = self.view.bounds
        self.view.addSubview(controller.view)
        self.addChild(controller)
        controller.didMove(toParent: self)
        
        let channel = FlutterMethodChannel(
            name: "platformChannel",
            binaryMessenger: controller.binaryMessenger
        )

       channel.setMethodCallHandler({
           (call: FlutterMethodCall, result: FlutterResult) -> Void in
           if (call.method == "exit") {
            self.navigationController?.popViewController(animated: true)
           }
       })
        
    }
    
    
}

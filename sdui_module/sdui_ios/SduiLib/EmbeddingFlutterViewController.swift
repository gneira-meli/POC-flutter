//
//  EmbeddingFlutterViewController.swift
//  SduiLib
//
//  Created by Gabriel Fernando Neira Bermudez on 1/09/21.
//

import UIKit
import Flutter

public class EmbeddingFlutterViewController: UIViewController {

    public var route : String?
    
    public override func viewDidLoad() {
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

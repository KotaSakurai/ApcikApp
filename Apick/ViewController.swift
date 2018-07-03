//
//  ViewController.swift
//  Apick
//
//  Created by 桜井広大 on 2018/07/03.
//  Copyright © 2018年 KotaSakurai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var textField: UITextField!
    @IBAction func tapButton(_ sender: Any) {
    
        let url = NSURL(string: "http://192.168.1.2:3000/api/v1/users")!
        let request = NSMutableURLRequest(url: url as URL)
        
        request.httpMethod = "POST"
        
        //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let params: [String: AnyObject] = [
            "user": [
                "phone": textField.text!,
                "device_id": "1"
                ] as AnyObject
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params)
            
            
            let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error == nil) {
                    _ = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
                }
            })
            task.resume()
            //        close(<#Int32#>)
        } catch {
            return
        }
    }
    
    
    
    func aaa() {
        
    }
}


//
//  AuthViewController.swift
//  Apick
//
//  Created by kazuma on 2018/07/05.
//  Copyright © 2018年 KotaSakurai. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tapButton(_ sender: Any) {
        
        let url = NSURL(string: "http://192.168.1.2:3000/api/v1/phone_auth")!
        let request = NSMutableURLRequest(url: url as URL)
        
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let params: [String: AnyObject] = [
            "phone_auth": [
                "token": textField.text!,
                "phone": delegate.phone
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
        } catch {
            return
        }
    }

}

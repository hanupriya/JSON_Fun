//
//  ViewController.swift
//  JSON_Fun
//
//  Created by Hanu Priya on 03/02/17.
//  Copyright © 2017 MadLab. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://api.fixer.io/latest")
        //getting the data
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print ("ERROR") // if no data
            }
            else{ //putting the data into content
                if let content = data
                {
                    do{ // converting the data into an array
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        //converting to dictionary
                        if let rates = myJson["rates"] as? NSDictionary
                        {// extracting an element from the dictionary using its object ID
                            print ("The List of the value of the currencies are :",rates)
                            if let currency = rates["INR"]
                            {
                                print (currency)
                            }
                        }
                        
                        
                    }
                    catch{
                        
                    }
                }
            }
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


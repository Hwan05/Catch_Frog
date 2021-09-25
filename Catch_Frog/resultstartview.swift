//
//  resultstartview.swift
//  Catch_Frog
//
//  Created by Hwan의 MacBook Pro on 2021/09/20.
//

import UIKit


class resultstartview: UIViewController {
    override func viewDidLoad() {
        //
    }
    

    @IBOutlet var nameText: UITextField!
    
    @IBAction func resultname(_ sender: Any) {
        guard let mvc = storyboard?.instantiateViewController(identifier: "MVC") as? ViewController else{
            return
        }
        
        mvc.hunter = nameText.text!
        
        
        
        mvc.modalPresentationStyle = .fullScreen
        self.present(mvc, animated: false)
        
        
    }
}


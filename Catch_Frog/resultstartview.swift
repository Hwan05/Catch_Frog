//
//  resultstartview.swift
//  Catch_Frog
//
//  Created by Hwan의 MacBook Pro on 2021/09/20.
//

import UIKit


class resultstartview: UIViewController, UITableViewDelegate {
    

    
    override func viewDidLoad() {
        //

    }

    @IBOutlet var nameText: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            let ad = UIApplication.shared.delegate as? AppDelegate
            ad?.paramname = self.nameText.text
          
        }
    }
}


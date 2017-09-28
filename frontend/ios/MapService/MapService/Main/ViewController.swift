//
//  ViewController.swift
//  MapService
//
//  Created by Vadim on 28/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var smsEnabled: UISwitch!
    
    @IBAction func enableSms(_ sender: Any) {
        GlobalInfo.smsIsEnabled = smsEnabled.isOn
    }
    
}


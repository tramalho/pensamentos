//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by Thiago Antonio Ramalho on 21/06/20.
//  Copyright © 2020 Tramalho. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var switchAutoRefresh: UISwitch!
    @IBOutlet weak var labelTimeInterval: UILabel!
    @IBOutlet weak var slidertimeInverval: UISlider!
    @IBOutlet weak var segmentedControlColorScheme: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
    }
    
    @IBAction func changeTimeInverval(_ sender: UISlider) {
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
    }
    
}

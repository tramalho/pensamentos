//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by Thiago Antonio Ramalho on 21/06/20.
//  Copyright © 2020 Tramalho. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    private let config = Settings.shared
    
    @IBOutlet weak var switchAutoRefresh: UISwitch!
    @IBOutlet weak var labelTimeInterval: UILabel!
    @IBOutlet weak var slidertimeInverval: UISlider!
    @IBOutlet weak var segmentedControlColorScheme: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        config.autoRefresh = sender.isOn
    }
    
    @IBAction func changeTimeInverval(_ sender: UISlider) {
        let interval = Double(sender.value)
        changeMessageInterval(with: interval)
        config.timeInverval = interval
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }
 
    private func formatView() {
        switchAutoRefresh.setOn(config.autoRefresh, animated: false)
        changeMessageInterval(with: config.timeInverval)
        slidertimeInverval.value = Float(config.timeInverval)
        segmentedControlColorScheme.selectedSegmentIndex = config.colorScheme
    }
    
    private func changeMessageInterval(with value: Double) {
        labelTimeInterval.text = "Mudar após \(Int(value)) segundos"
    }
}

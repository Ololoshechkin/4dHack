//
//  GeneralMenuVC.swift
//  MapService
//
//  Created by Vadim on 28/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class GeneralMenuVC: UIViewController {
    
    let (minDuration, maxDuration) = (1, 600)
    var duration: Int = 300

    let minWalkDuration = 1
    var maxWalkDuration: Int {
        get {
            return duration
        }
    }
    let (minBudget, maxBudget) = (0, 5000)
    
    var walkDuration: Int = 300
    var budget: Int = 2500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // textboxes
    
    @IBOutlet weak var from: UITextField!
    
    @IBOutlet weak var to: UITextField!
    
    // sliders
    
    @IBOutlet weak var durationSlider: UISlider!
    
    @IBOutlet weak var walkDurationSlider: UISlider!
    
    @IBOutlet weak var budgetSlider: UISlider!
    
    // labels
    
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var walkDurationLabel: UILabel!
    
    @IBOutlet weak var budgetLabel: UILabel!
    
    // slider updates
    
    private func getValue(slider: UISlider, minValue: Int, maxValue: Int) -> Int {
        let delta = Float(maxValue - minValue)
        let sliderDelta = slider.maximumValue - slider.minimumValue
        return Int(Float(minValue) + slider.value * delta / sliderDelta)
    }
    
    private func updateAll() {
        duration = getValue(
            slider: durationSlider,
            minValue: minDuration,
            maxValue: maxDuration
        )
        durationLabel.text = "\(duration) min"
        
        walkDuration = getValue(
            slider: walkDurationSlider,
            minValue: minWalkDuration,
            maxValue: maxWalkDuration
        )
        walkDurationLabel.text = "\(walkDuration) min"
        
        budget = getValue(
            slider: budgetSlider,
            minValue: minBudget,
            maxValue: maxBudget
        )
        budgetLabel.text = "\(budget) rub"
    }
    
    @IBAction func durationUpdate(_ sender: Any) {
        updateAll()
    }
    
    
    @IBAction func walkDurationUpdate(_ sender: Any) {
        updateAll()
    }
    
    @IBAction func budgetUpdate(_ sender: Any) {
        updateAll()
    }
    
    // buttons
    
    @IBAction func customSettings(_ sender: Any) {
        
    }
    
    @IBAction func go(_ sender: Any) {
        if (GlobalInfo.smsIsEnabled) {
             sendBySms()
        } else {
            // TODO
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (from.text == "") {
            GlobalInfo.from = from.placeholder!
        } else {
            GlobalInfo.from = from.text!
        }
        if (to.text == "") {
            GlobalInfo.to = to.placeholder!
        } else {
            GlobalInfo.to = to.text!
        }
        GlobalInfo.duration = duration
        GlobalInfo.walkDuration = walkDuration
        GlobalInfo.budget = budget
    }
    
}

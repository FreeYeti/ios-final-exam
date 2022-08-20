//
//  AssessmentView.swift
//  FinalExam
//
//  Created by Jack on 2022/8/17.
//

import UIKit

class AssessmentView: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // use default color
        view.backgroundColor = hexStringToUIColor(hex: CONFIG_MAIN_BGCOLOR)
        
        resultLabel.text = ""
    }
    
    @IBAction func clickYes(){
        resultLabel.text = "Please get tested for COVID-19."
        yesBtn.isEnabled = false
        noBtn.isEnabled = false
    }
    
    @IBAction func clickNo(){
        resultLabel.text = "You are ok, please don't worry."
        yesBtn.isEnabled = false
        noBtn.isEnabled = false
    }
}

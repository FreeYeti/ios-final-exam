//
//  ProtectionView.swift
//  FinalExam
//
//  Created by Jack on 2022/8/17.
//

import UIKit

class ProtectionView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // use default color
        view.backgroundColor = hexStringToUIColor(hex: CONFIG_MAIN_BGCOLOR)
    }
}

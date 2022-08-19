//
//  MainViewNavigation.swift
//  FinalExam
//
//  Created by Jack on 2022/8/18.
//

import Foundation
import UIKit

extension MainView {
    
    // hide the navigation bar for root view controller
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    // show the navigation bar for other view controller
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}

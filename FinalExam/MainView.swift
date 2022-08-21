//
//  MainView.swift
//  FinalExam
//
//  Created by Jack on 2022/8/17.
//

import UIKit
import Charts

class MainView: UIViewController {
    
    // outlets on the screen
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var barChartView: UIView!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    // the statistics figures
    var StateTotal: Int?
    var StateRecovered: Int?
    var StateDeaths: Int?
    var StateRecoveredRatio: Double?
    var StateDeathsRatio: Double?
    
    // as aimed at well enginerring, I use severial files to sperate code and logic:
    // 1. the override functions for Navigation is in MainViewNavigation.swfit
    // 2. the functions for collection view is in the MainViewDashboard.swift
    // 3. the view for chart is in the MainViewChartView.swift
    // 4. the view for local info is in the MainViewLocalView.swift
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set bgcolor
        view.backgroundColor = hexStringToUIColor(hex: CONFIG_MAIN_BGCOLOR)
        scrollView.backgroundColor = hexStringToUIColor(hex: CONFIG_MAIN_BGCOLOR)
        
        // set scroll content size
        let height = 940
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: Double(height))
        
        // load the collection view
        self.loadCollectionView()
        
        // colors for button
//        btn1.layer.backgroundColor = CONFIG_BTN_PRIMARY_COLOR.cgColor
//        btn2.layer.backgroundColor = CONFIG_BTN_PRIMARY_COLOR.cgColor
//        btn1.titleLabel?.textColor = CONFIG_TEXT_COLOR
    }
}


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
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 900)
        
        // load the collection view
        self.loadCollectionView()
    }
}


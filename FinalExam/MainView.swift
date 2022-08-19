//
//  MainView.swift
//  FinalExam
//
//  Created by Jack on 2022/8/17.
//

import UIKit

class MainView: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var StateTotal: Int?
    var StateRecovered: Int?
    var StateDeaths: Int?
    var StateRecoveredRatio: Double?
    var StateDeathsRatio: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set bgcolor
        view.backgroundColor = hexStringToUIColor(hex: CONFIG_MAIN_BGCOLOR)
        scrollView.backgroundColor = hexStringToUIColor(hex: CONFIG_MAIN_BGCOLOR)
        
        // set scroll content size
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1000)
        
        // load the collection view
        self.loadCollectionView()
    }
}


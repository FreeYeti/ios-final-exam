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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set bgcolor
        view.backgroundColor = hexStringToUIColor(hex: CONFIG_MAIN_BGCOLOR)
        scrollView.backgroundColor = hexStringToUIColor(hex: CONFIG_MAIN_BGCOLOR)
        
        // set scroll content size
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1000)
        
        // the layout of collection view
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        // register cell, and use delegate
        collectionView.register(DashboardCell.nib(), forCellWithReuseIdentifier: DashboardCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // allow shadows overflow the bounds
        collectionView.clipsToBounds = false
        // apply background color programming
        collectionView.backgroundColor = hexStringToUIColor(hex: CONFIG_MAIN_BGCOLOR)
        
        // load json data and init the values
        let data = loadJson(filename: "covid_data")!
        
        // the data of whole world
        if let global = data.first {
            StateTotal = global.totalConfirmed
            StateDeaths = global.totalDeaths ?? 0
            StateRecovered = global.totalRecovered ?? 0
            StateDeathsRatio = (Double(Double(StateDeaths ?? 0) / Double(StateTotal ?? 1)) * 100).rounded() / 100
            StateRecoveredRatio = (Double(Double(StateRecovered ?? 0) / Double(StateTotal ?? 1)) * 100).rounded() / 100
        }
    }
}


//
//  MainView.swift
//  FinalExam
//
//  Created by Jack on 2022/8/17.
//

import UIKit

class MainView: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        collectionView.backgroundColor = hexStringToUIColor(hex: "#2B2F39")
    }
}

// The tap event, deselect the item
extension MainView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

// bind data source
extension MainView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    // apply values into cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardCell.identifier, for: indexPath) as! DashboardCell
        if (indexPath.row == 0){
            // total cases cell
            cell.config(title: "Total", value: "123123")
        }else if (indexPath.row == 1){
            // recovered cases cell
            cell.config(title: "Recovered", value: "123123")
        }else if (indexPath.row == 2){
            // death cases cell
            cell.config(title: "Deaths", value: "123123")
        }else if (indexPath.row == 3){
            // recovered ratio cell
            cell.config(title: "Recovered ratio", value: "99.6%")
        }else{
            // deaths ratio cell
            cell.config(title: "Deaths ratio", value: "0.4%")
        }
        
        return styleCollectionViewCell(cell)
    }
}

// custom size of cells
extension MainView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(indexPath.row < 3){
            // first row
            let width  = (view.frame.width - 20) / 3 - 7
            return CGSize(width: width, height: 50)
        }else{
            // second row
            let width  = (view.frame.width - 20) / 2 - 6
            return CGSize(width: width, height: 50)
        }
    }
}

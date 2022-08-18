//
//  MainViewDashboard.swift
//  FinalExam
//
//  Created by Jack on 2022/8/18.
//
import Foundation
import UIKit


// The tap event, deselect the item
extension MainView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

// bind data source
extension MainView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5 // five blocks on the small dashboard
    }
    
    // apply values into cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardCell.identifier, for: indexPath) as! DashboardCell
        if (indexPath.row == 0){
            // total cases cell
            cell.config(title: "Total", value: "\(StateTotal ?? 0)")
        }else if (indexPath.row == 1){
            // recovered cases cell
            cell.config(title: "Recovered", value: "\(StateRecovered ?? 0)")
        }else if (indexPath.row == 2){
            // death cases cell
            cell.config(title: "Deaths", value: "\(StateDeaths ?? 0)")
        }else if (indexPath.row == 3){
            // recovered ratio cell
            cell.config(title: "Recovered ratio", value: "\(StateRecoveredRatio ?? 0.0)%")
        }else{
            // deaths ratio cell
            cell.config(title: "Deaths ratio", value: "\(StateDeathsRatio ?? 0.0)%")
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
            return CGSize(width: width, height: 90)
        }else if (indexPath.row < 5){
            // second row
            let width  = (view.frame.width - 20) / 2 - 6
            return CGSize(width: width, height: 90)
        }else{
            return CGSize(width: view.frame.width, height: 90)
        }
    }
}

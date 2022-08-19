//
//  MainViewChart.swift
//  FinalExam
//
//  Created by Jack on 2022/8/18.
//

import Foundation
import Charts
import UIKit

// for chart part
extension MainView: ChartViewDelegate{
    func loadChartView(){
        barChart.delegate = self
    }
    
    func chartViewSubview(){
        // create chart frame
        barChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        
        // position of chart
        barChart.center = self.view.center
        
        // add to main view
        view.addSubview(barChart)
        
        // bind data
        let set = BarChartDataSet(entries: [
            BarChartDataEntry(x: 1, y: 1),
            BarChartDataEntry(x: 2, y: 2),
            BarChartDataEntry(x: 3, y: 3),
            BarChartDataEntry(x: 4, y: 4)
        ])
        
        set.colors = ChartColorTemplates.liberty()
        
        let data = BarChartData(dataSet: set)
        
        barChart.data = data
    }
}

//
//  MainViewChartView.swift
//  FinalExam
//
//  Created by Jack on 2022/8/18.
//

import UIKit
import Charts

class MainViewChartView: UIView, ChartViewDelegate {

    /*
     Not sure is this the best way to load barChart into main view controller?
     I don't find information about hot to add chart to view controller smoothly,
     so create this container first, then put the chart into this container.
     */
    
    var chart = PieChartView()
    
    override func layoutSubviews() {
        self.clipsToBounds = false
        self.clipsToBounds = false
        
        // for border and background
        self.layer.backgroundColor = hexStringToUIColor(hex: CONFIG_MAIN_BGCOLOR).cgColor
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = hexStringToUIColor(hex: CONFIG_HIGHLIGHT_COLOR).cgColor
        self.layer.masksToBounds = true
        
        // for shadow
        self.layer.shadowColor = hexStringToUIColor(hex: CONFIG_HIGHLIGHT_COLOR).cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 3)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(rect: self.layer.bounds).cgPath
        
        chart.delegate = self
        self.chartViewSubview()
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "BarChartView", bundle: nil)
    }
    
    func chartViewSubview(){
        
        // get covid data from json
        let covidData = loadJson(filename: "covid_data")!
        
        // figures
        let stateTotal = covidData.first?.totalConfirmed ?? 0
        let stateDeaths = covidData.first?.totalDeaths ?? 0
        let stateRecovered = covidData.first?.totalRecovered ?? 0
        
        // create chart frame
        chart.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        
        // chart color
        chart.legend.textColor = CONFIG_TEXT_HIGHLIGHT_COLOR
        chart.drawHoleEnabled = false
        
        // add to main view
        self.addSubview(chart)
        
        // bind data
        let set = PieChartDataSet(entries: [
            PieChartDataEntry(value: Double(stateTotal), label: "Total confirmed"),
            PieChartDataEntry(value: Double(stateDeaths), label: "Deaths"),
            PieChartDataEntry(value: Double(stateRecovered), label: "Total recovered"),
        ])
        
        // chart config
        set.colors = ChartColorTemplates.colorful()
        set.drawIconsEnabled = false
        set.sliceSpace = 2
        set.selectionShift = 0
        set.valueLinePart1OffsetPercentage = 0.20
        set.valueLinePart1Length = 0.4
        set.valueLinePart2Length = 0.4
        set.valueLineColor = CONFIG_TEXT_COLOR
        set.valueTextColor = CONFIG_TEXT_COLOR
        set.xValuePosition = .outsideSlice
        set.yValuePosition = .outsideSlice
        
        // set data of chart
        let data = PieChartData(dataSet: set)
        chart.data = data
    }
}

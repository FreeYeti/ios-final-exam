//
//  MainViewLocalView.swift
//  FinalExam
//
//  Created by Jack on 2022/8/20.
//

import UIKit
import MapKit
import CoreLocation

class MainViewLocalView: UIView, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var locationManager = CLLocationManager()
    
    // outlets
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    // init this view
    override func layoutSubviews() {
        countryNameLabel.text = "loading..."
        
        // config the text color for labels
        countryNameLabel.textColor = CONFIG_TEXT_COLOR
        dataLabel.textColor = CONFIG_TEXT_COLOR
        
        map.delegate = self
        self.styleView()
        self.loadLocation()
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        countryNameLabel.resignFirstResponder()
    }
    
    func styleView(){
        self.clipsToBounds = false
        self.clipsToBounds = false
        
        map.layer.cornerRadius = 10.0
        
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
    }
    
    func loadLocation(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            // stop tracking
            locationManager.stopUpdatingLocation()
            
            loadLocalData(location)
        }// location
    } // locationManager
    
    func loadLocalData(_ location: CLLocation){
        CLGeocoder().reverseGeocodeLocation(location) {(placemarks, error) in
            // if faided to read place marks
            if (error != nil)
            {
                DispatchQueue.main.async {
                    self.countryNameLabel.text = "Failed to load country name."
                }
                print("reverse geodcode fail: \(error!.localizedDescription)")
            }
            
            let pm = placemarks! as [CLPlacemark]

            // if has country name
            if pm.count > 0 {
                let pm = placemarks![0]
                DispatchQueue.main.async {
                    self.countryNameLabel.text = "Data of \(pm.country ?? "your country")"
                    let countryData = self.getDataByCountryName(pm.country ?? "")
                    if countryData != nil {
                        let msg = "Total: \(countryData!.totalConfirmed) Deaths: \(countryData!.totalDeaths ?? 0) Recovered: \(countryData!.totalRecovered ?? 0)"
                        self.dataLabel.text = msg
                    }
                    
                }
            }
        
        }
    }
    
    func getDataByCountryName(_ countryName: String?) -> CovidData?{
        if countryName == nil {
            return nil
        }
        
        // get covid data from json
        let covidData = loadJson(filename: "covid_data")!
        
        let worldData = covidData.first!
        
        for countryData in worldData.areas{
            if countryData.displayName == countryName {
                return countryData
            }
        }
        
        return nil
    }
}

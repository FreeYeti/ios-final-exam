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
        countryNameLabel.textColor = CONFIG_TEXT_HIGHLIGHT_COLOR
        dataLabel.textColor = CONFIG_TEXT_HIGHLIGHT_COLOR
        
        // label background
        let bgcolor = hexStringToUIColor(hex: CONFIG_MAIN_BGCOLOR)
        bgcolor.withAlphaComponent(0.5)
        countryNameLabel.backgroundColor = bgcolor
        dataLabel.backgroundColor = bgcolor
        
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
            
            // load the data
            loadLocalData(location)
            
            // zoom to area where user in
            panToLocation(location)
        }// location
    } // locationManager
    
    // load the country data of the user
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
                    // update data of that country
                    self.countryNameLabel.text = "Data of \(pm.country ?? "your country")"
                    let countryData = self.getDataByCountryName(pm.country ?? "")
                    if countryData != nil {
                        let msg = "Total: \(countryData!.totalConfirmed) Deaths: \(countryData!.totalDeaths ?? 0) Recovered: \(countryData!.totalRecovered ?? 0)"
                        self.dataLabel.text = msg
                    }
                    
                    // high light the country bound
                    self.highLightCountry(location, pm.country ?? nil)
                }
            }
        }
    }
    
    // get covid data by country name
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
    
    // zoom to user location
    func panToLocation(_ location: CLLocation) {
        // center position
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)

        let delta: Double = 15.0
        let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        map.setRegion(region, animated: true)
    } //render
    
    // high light the country which the user is at
    func highLightCountry(_ location: CLLocation, _ countryName: String?){
        if countryName == nil {
            return
        }

        let geoJson = parseGeoJson()
        
        // the list of overlay
        var overlays = [MKOverlay]()
        
        // read geojson items
        for item in geoJson {
            guard let feature = item as? MKGeoJSONFeature else {
                return
            }
            
            // search for country name in the data
            let properties = String(decoding: feature.properties!, as: UTF8.self)
            if properties.contains(countryName!) {
                
                // add multipolygon data to the overlay list
                for geo in feature.geometry {
                    if let polygon = geo as? MKMultiPolygon{
                        overlays.append(polygon)
                    }
                }
                break
            }
            
        }
        
        // add the overlays to map
        DispatchQueue.main.async {
            self.map.addOverlays(overlays)
        }
    }
    
    // the renderer function
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        // I only have multipolygon here
        if let multipolygon = overlay as? MKMultiPolygon {
            let renderer = MKMultiPolygonRenderer(multiPolygon: multipolygon)
            renderer.fillColor = UIColor(red: 220.0/255.0, green: 95.0/255.0,  blue: 19.0/255.0, alpha: 0.2)
            renderer.strokeColor = UIColor.brown
            return renderer
        }
        
        return MKOverlayRenderer(overlay: overlay)
    }
}

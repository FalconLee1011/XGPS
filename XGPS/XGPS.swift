//
//  XGPSlib.swift
//  XGPS
//
//  Created by FalconLee on 3/10//2019.
//  Modified by FalconLee on 1/06//2020.
//  Copyright © 2020 FXTLiDEV. All rights reserved.
//


import Foundation
import CoreLocation

class XGPSlib: NSObject, CLLocationManagerDelegate {
    
    enum unit{
        case kmh
        case mph
    }

    func getSpeed(_ manager: CLLocationManager, _ _unit: unit) -> Double{
        manager.startUpdatingLocation()
        let spd = manager.location?.speed ?? 0.0
        manager.stopUpdatingLocation()
        
        switch _unit {
        case .kmh:
            if((spd * 3.6) >= 0) {return (spd * 3.6) as Double}
            else {return 0}
        case .mph:
            if(spd >= 0) {return spd as Double}
            else {return 0}
        }
    }
    
    func getCoordinate(_ manager: CLLocationManager) -> (Double, Double){
        manager.startUpdatingLocation()
        let coordinate = (Double(String(format: "%.6f", manager.location?.coordinate.latitude ?? 0.0)), Double(String(format: "%.6f", manager.location?.coordinate.longitude ?? 0.0)))
        manager.stopUpdatingLocation()
        return coordinate as! (Double, Double)
    }
    
    func getLatitude(_ manager: CLLocationManager) -> Double{
        manager.startUpdatingLocation()
        let Lat = Double(String(format: "%.6f", manager.location?.coordinate.latitude ?? 0.0))
        manager.stopUpdatingLocation()
        return Lat ?? 0.0
    }
    func getLongitude(_ manager: CLLocationManager) -> Double{
        manager.startUpdatingLocation()
        let Lng = Double(String(format: "%.6f", manager.location?.coordinate.longitude ?? 0.0))
        manager.stopUpdatingLocation()
        return Lng ?? 0.0
    }
    
    func getHeading(_ headingManager: CLLocationManager) -> Int{
        
        headingManager.startUpdatingLocation()
        
        let tn = Int(String(format: "%.0f", headingManager.heading?.trueHeading ?? 0))
        headingManager.stopUpdatingLocation()
        return tn!
    }
    
    func getDirection(_ degree: Int) -> String{
        if(degree >= 338 || degree <= 22){
            return "N"
        }
        else if(degree >= 23 && degree <= 67) {
            return "NE"
        }
        else if(degree >= 68 && degree <= 112) {
            return "E"
        }
        else if(degree >= 113 && degree <= 156) {
            return "SE"
        }
        else if(degree >= 157 && degree <= 202) {
            return "S"
        }
        else if(degree >= 203 && degree <= 247) {
            return "SW"
        }
        else if(degree >= 248 && degree <= 292) {
            return "W"
        }
        else if(degree >= 293 && degree <= 337) {
            return "NW"
        }
        else {
            return "ERROR"
        }
    }
    
    
}

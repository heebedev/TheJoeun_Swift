//
//  ViewController.swift
//  pControlMapView
//
//  Created by ZZEUNG on 27/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let locationManager = CLLocationManager()
    let latitudeValues = [37.5878892, 37.5711907, 37.5926027, 37.5956584]
    let longituteValues = [127.0037098, 127.009506, 126.9664771, 126.9810576]
    let locationName = ["혜화문", "흥인지문", "창의문", "숙정문"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        setAnnotation(latitudeValue: latitudeValues[0], longitudeValue: longituteValues[0], delta: 0.01, title: locationName[0])
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.black
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        
        return pLocation
    }
    
    //위치가 없데이트 되었을 때 지도의 위치를 표시해주는 함수
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        // delta:0.01 -> 기존 지도의 100배 확대
        locationManager.stopUpdatingLocation()
    }
    
    // Pin 설치
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title: String) {
        let annotation = MKPointAnnotation() // Pin
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = title
        myMap.addAnnotation(annotation)
        
    }
    
    @IBAction func sgChangeLoc(_ sender: UIPageControl) {
        let num = pageControl.currentPage
        setAnnotation(latitudeValue: latitudeValues[num], longitudeValue: longituteValues[num], delta: 0.01, title: locationName[num])
        
        
    }
    
}


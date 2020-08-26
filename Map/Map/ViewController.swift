//
//  ViewController.swift
//  Map
//
//  Created by ZZEUNG on 26/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var lblLocationInfo1: UILabel!
    @IBOutlet weak var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        
        // 정확도를 최고조로 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 위치데이터를 확인하기 위해 승인 요청
        locationManager.requestWhenInUseAuthorization()
        //위치 업데이트 시작
        locationManager.startUpdatingLocation()
        //위치보기
        myMap.showsUserLocation = true
    }
    
    //원하는 위도와 경도의 지도 띄우기
    //위도와 경도에 대한 함수
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
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler:{(placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address : String = country!
            if pm!.locality != nil { //옛날 주소.. 지역 주소...
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil { // 도로명 주소
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        //Handler 나오면 함수쓰라는 이야기야...
        locationManager.stopUpdatingLocation()
    }


    // Pin 설치
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subTitle strSubTitle: String) {
        
        let annotation = MKPointAnnotation() // Pin
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubTitle
        myMap.addAnnotation(annotation)
        
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.lblLocationInfo1.text = " "
            self.lblLocationInfo2.text = " "
            locationManager.startUpdatingLocation()
        } else if sender.selectedSegmentIndex == 1 {
            //둘리 뮤지엄
            setAnnotation(latitudeValue: 37.65243153, longitudeValue: 127.0276397, delta: 0.01, title: "둘리뮤지엄", subTitle: "서울특별시 도봉구 시루봉로 1길 6")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "둘리 뮤지엄"
        } else if sender.selectedSegmentIndex == 2 {
        //서대문 형무소
            setAnnotation(latitudeValue: 37.57244171, longitudeValue: 126.9595412, delta: 0.01, title: "서대문형무소역사관", subTitle: "서울특별시 서대문구 통일로 251")
        self.lblLocationInfo1.text = "보고 계신 위치"
        self.lblLocationInfo2.text = "서대문 형무소 역사관"
        }
    }
}


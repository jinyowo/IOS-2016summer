//
//  ViewController.swift
//  Map
//
//  Created by LeeBeomGeun
//  Copyright © 2015년 LeeBeomGeun. All rights reserved.
//

import UIKit
import MapKit   //지도삽입을 위해 추가

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!            //mapview outlet변수 선언
    @IBOutlet weak var lblLocationInfo1: UILabel!   //하단의 라벨1
    @IBOutlet weak var lblLocationInfo2: UILabel!   //하단의 라벨2
    
    //위치정보를 얻기위해
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //하단의 라벨2개 초기화(공백)
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        
        //CLLocationManeger정보 초기화
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest   //위치나타낼때 정확도
        
        //return값을 받지않아도 자동으로 해줌(거절받으면 뒤의 구문을 실행X)
        locationManager.requestWhenInUseAuthorization() //사용자에게 위치정보를 사용해도 될지 물어봄
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //지정된 정보에 따라 해당위치로 이동시킴(화면출력)
    func goLocation(latitude latitudeValue: CLLocationDegrees, longitude longitudeValue : CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpanMake(span, span)
        let pRegion = MKCoordinateRegionMake(pLocation, spanValue)
        
        //Changes the currently visible region and optionally animates the change.
        //The new region to display in the map view
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    

    //원하는 위치에 핀을 생성
    func setAnnotation(latitude latitudeValue: CLLocationDegrees, longitude longitudeValue : CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubtitle:String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitude: latitudeValue, longitude: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        
        //Adds an array of annotation objects to the map view.
        myMap.addAnnotation(annotation)
        
    }
    
    //새로운 위치정보 발생시 실행되는 메소드
    //위치정보가 업데이트되면 자동 호출
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        goLocation(latitude: (pLocation?.coordinate.latitude)!, longitude: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        //위도경도값으로 역으로 주소정보를 찾아냄
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address

        })
        
        //업데이트중지 (중지시키지않으면 계속 업데이트되어 다른행동을 못함)
        locationManager.stopUpdatingLocation()
    }
    
    //상단의 세그먼트컨트롤
    @IBAction func sgChangeLocation(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()

        } /*저장해둔 주소로 맵의 위치를 바꾸고 하단라벨출력*/
        else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitude: 37.1408211, longitude: 127.64977750000003, delta: 1, title: "강동대학교", subtitle: "충북 음성군 감곡면 대학길 278")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "강동대학교"
        } else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latitude: 37.5307871, longitude: 126.8981, delta: 0.1, title: "이지스퍼블리싱", subtitle: "서울시 영등포구 당산로 41길 11")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "이지스퍼블리싱 출판사 "
        }
    }

}


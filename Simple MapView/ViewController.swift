//
//  ViewController.swift
//  Simple MapView
//
//  Created by D7703_23 on 2018. 6. 5..
//  Copyright © 2018년 D7703_23. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myMapView: MKMapView!
    
    var count = 0
    
    var foodStoreNames = ["늘해랑", "번개반점", "아딸", "왕짜장", "토마토 도시락", "홍콩반점"]
    
    var foodStoreAddress = ["부산광역시 부산진구 양정1동 336-17",
                            "부산광역시 부산진구 양정동 418-282",
                            "부산광역시 부산진구 양정동 393-18",
                            "부산광역시 부산진구 양정1동 356-22",
                            "부산광역시 부산진구 양정1동 350-1",
                            "부산광역시 부산진구 양정동 353-38"]
    
    var foodStoreTel = ["051-863-6997",
                        "051-852-9969",
                        "051-852-9969",
                        "051-852-9969",
                        "051-852-9969",
                        "051-853-0410"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 번개반점
        // 35.167669, 129.070576
        // 부산광역시 부산진구 양정동 418-282
        
        // 동의과학대학교
        // 부산광역시 부산진구 양정동 429-19
        // 35.165902, 129.072554
        
        // 지도 center, span, region 표시하기
        // 위도 경도
        
        // 동의과학대학교
       // let loc01 = CLLocationCoordinate2D(latitude: 35.167669, longitude: 129.070576)
        
        // 번개반점
        let center = CLLocationCoordinate2D(latitude: 35.165902,  longitude: 129.072554)
        
        // 반경(zoom in, out)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.01)
        
        // region 객체(center, span)
        let region = MKCoordinateRegion(center: center, span: span)
        
        // 지도에 표시하기
        myMapView.setRegion(region, animated: true)
        
        //// annotation 표시하기
//        let pin01 = MKPointAnnotation()
//        pin01.coordinate = loc01
//        pin01.title = "번개반점"
//        pin01.subtitle = "부산광역시 부산진구 양정동 418-282"
//        myMapView.addAnnotation(pin01)
        
        let pin02 = MKPointAnnotation()
        pin02.coordinate = center
        pin02.title = "DIT 동의과학대학교"
        pin02.subtitle = "부산광역시 부산진구 양정동 429-19"
        myMapView.addAnnotation(pin02)
        
        // geocoding : 주소 -> 위도, 경도
//        let addr = "부산광역시 부산진구 양정1동 350-1"
//        let geocoder = CLGeocoder()
//        geocoder.geocodeAddressString(addr) {
//
//            (placemarks: [CLPlacemark]?, error: Error?) -> Void in
//            if let error = error {
//                print(error)
//                return
//            } else {
//                print("nil 발생")
//            }
//            
//            if let placemarks = placemarks {
//                let placemark = placemarks[0]
//             //   print(placemark.location)
//             //   print(placemark.name!)
//             //   print(placemark.postalCode!)
//             //   print(placemark.country!)
//                let loc02 = placemark.location?.coordinate
//                let pin03 = MKPointAnnotation()
//                pin03.coordinate = loc02!
//                pin03.title = "토마토 도시락"
//                pin03.subtitle = addr
//                self.myMapView.addAnnotation(pin03)
//
//
//
//                
//            } else {
//                print("nil 발생")
//            }
//        }
        
        for addr in foodStoreAddress {
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(addr) {
                (placemarks: [CLPlacemark]?, error: Error?) -> Void in
                    if let myError = error {
                        print(myError)
                        return
                    }
                
                let myPlacemark = placemarks![0]
//                print(myPlacemark.location?.coordinate)
                let loc = myPlacemark.location?.coordinate
                let annoation = MKPointAnnotation()
                annoation.coordinate = loc!
                annoation.title = self.foodStoreNames[self.count]
                annoation.subtitle = self.foodStoreTel[self.count]
                self.count = self.count + 1
                
                self.myMapView.addAnnotation(annoation)
            }
        }
    }
}




//
//  MapViewController.swift
//  FansArea
//
//  Created by harry on 16/04/2017.
//  Copyright © 2017 harry. All rights reserved.
//

import MapKit
import UIKit

class MapViewController: UIViewController, MKMapViewDelegate {
    var area: AreaMO!

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapView.showsScale = true
        mapView.showsCompass = true
        mapView.showsTraffic = true
        mapView.showsUserLocation = true
        mapView.showsBuildings = true
        
        let coder = CLGeocoder() // 实例化
        coder.geocodeAddressString(area.name!) { (ps, error) in
            guard let ps = ps else {
                print(error ?? "未知错误")
                return
            }
            // 取出第一个字
            let place = ps.first
            let annotation = MKPointAnnotation() //实例化一个标注
            annotation.title = self.area.name
            annotation.subtitle = self.area.province
            
            // 如果地点可以解析出来，显示地标并且选中
            if let loc = place?.location {
                annotation.coordinate = loc.coordinate
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let id = "myAnnotationId"
        var av = mapView.dequeueReusableAnnotationView(withIdentifier: id) as? MKPinAnnotationView
        
        if av == nil {
            av = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
            av?.canShowCallout = true
        }
        
        let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
        leftIconView.image = UIImage(data: area.image as! Data)
        av?.leftCalloutAccessoryView = leftIconView
        av?.pinTintColor = UIColor.green //图钉颜色
        
        return av
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

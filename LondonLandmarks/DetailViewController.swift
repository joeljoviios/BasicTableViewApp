//
//  DetailViewController.swift
//  LondonLandmarks
//
//  Created by Joel on 06/07/21.
//  Copyright © 2021 LBrands. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    
    var sentData1:String!
    var sentData2:String!
    var sentData3:String!

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDesvription: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var detailMapView: MKMapView!
    @IBOutlet weak var directionButton: UIButton!
    
    var latitude = 0.0
    var longitude = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        directionButton.layer.cornerRadius = 5
        detailMapView.layer.cornerRadius = 5
        
        self.navigationItem.title = sentData1
        
        detailTitle.text = sentData1
        detailDesvription.text = sentData2
        
        detailImageView.image = UIImage(named: sentData3)
        
        if detailTitle.text == "Big Ben" {
            
            detailTextView.text = "Big Ben is the nickname for the Great Bell of the clock at the north end of the Palace of Westminster in London and is usually extended to refer to both the clock and the clock tower as well."
            
            latitude = 51.50072919999999
            longitude = -0.12462540000001354
            
        }
        
        if detailTitle.text == "Buckingham Palace" {
            
            detailTextView.text = "Buckingham Palace is the London residence and administrative headquarters of the reigning monarch of the United Kingdom. Located in the City of Westminster, the palace is often at the centre of state occasions and royal hospitality."
            
            latitude = 51.501364
            longitude = -0.1418899999999894
            
        }
        
        if detailTitle.text == "London Eye" {
            
            detailTextView.text = "The London Eye is a giant Ferris wheel on the South Bank of the River Thames in London. As of mid-January 2015, it has been known as the Coca-Cola London Eye. The structure is 443 feet tall and the wheel has a diameter of 394 feet."
            
            latitude = 51.50090849999999
            longitude = -0.1194981999999527
            
        }
        
        if detailTitle.text == "St-Pauls Cathedral" {
            
            detailTextView.text = "St Paul's Cathedral, London, is an Anglican cathedral, the seat of the Bishop of London and the mother church of the Diocese of London. It sits on Ludgate Hill at the highest point of the City of London and is a Grade 1 listed building."
            
            latitude = 51.513191
            longitude = -0.09759899999994559
            
        }
        
        if detailTitle.text == "Tower Bridge" {
            
            detailTextView.text = "Tower Bridge is a combined bascule and suspension bridge in London built between 1886 and 1894."
            
            latitude = 51.5049885
            longitude = -0.07570420000001832
            
        }
        
        if detailTitle.text == "Westminster Abbey" {
            
            detailTextView.text = "Westminster Abbey, formally titled the Collegiate Church of St Peter at Westminster, is a large, mainly Gothic abbey church in the City of Westminster, London, just to the west of the Palace of Westminster."
            
            latitude = 51.4994174
            longitude = -0.1275705000000471
            
        }
        
        let span = MKCoordinateSpanMake(0.005, 0.005)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(latitude, longitude), span: span)
        
        detailMapView.setRegion(region, animated: true)
        
        let pinLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let pinAnn = MKPointAnnotation()
        pinAnn.coordinate = pinLocation
        pinAnn.title = detailTitle.text
        pinAnn.subtitle = detailDesvription.text
        
        self.detailMapView.addAnnotation(pinAnn)
        
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
    
    @IBAction func directions(_ sender: Any) {
        
        UIApplication.shared.open(URL(string: "http://maps.apple.com/maps?daddr=\(latitude),\(longitude)")!, options: [:], completionHandler: nil)
        
    }
    
    

}

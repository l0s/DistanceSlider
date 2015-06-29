//
//  ViewController.swift
//  DistanceSlider
//
//  Created by Carlos Macasaet on 28/6/15.
//  Copyright (c) 2015 Carlos Macasaet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!

    let base = Double( 200 )
    let min = Double( 10 )
    let max = Double( 3500 )

    var distanceInMiles = 50

    override func viewDidLoad() {
        super.viewDidLoad()

        slider.value = 0.1855 // sets starting radius to ~50 (will vary depending on the base)
        updateDistance( slider, forEvent: UIEvent() )
    }

    func calculateDistance( sliderValue:Float ) -> Int
    {
        // source: http://stackoverflow.com/questions/19277653/exponential-algorithm-for-a-slider-control
        let doubleValue = ( max - min ) * ( pow( base, Double( sliderValue ) ) - pow( base, -Double( sliderValue ) ) ) / ( pow( base, Double( 1.0 ) ) - pow( base, Double( -1.0 ) ) ) + min
        let roundedValue = round( doubleValue / 5.0 ) * 5.0
        return Int( roundedValue )
    }

    @IBAction func updateDistance(sender: UISlider, forEvent event: UIEvent) {
        distanceInMiles = calculateDistance( sender.value )

        label.text = "\(distanceInMiles) Miles"
    }

}

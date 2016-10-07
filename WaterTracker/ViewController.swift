//
//  ViewController.swift
//  WaterTracker
//
//  Created by GengRui on 2016-10-06.
//  Copyright © 2016 GengRui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnWater: UIButton!
    
    var waterImage: [UIImage] = [
        UIImage(named: "imgWater_1")!,
        UIImage(named: "imgWater_2")!,
        UIImage(named: "imgWater_3")!,
        UIImage(named: "imgWater_4")!,
        UIImage(named: "imgWater_5")!
    ]
    
    let Key: String = "indexKey"
    
    let userDefaults = UserDefaults.standard
    
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Get the value from preferences store
        // if key not exist, index is 0
        index = userDefaults.integer(forKey: Key)
        
        setImage(index: index)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnWater_Click(_ sender: UIButton) {
        
        index += 1
        
        // Overlay incremental images on the full water cup to simulate it becoming empty.
        if(index > 4){
            index = 0;
        }
        
        setImage(index: index)
        
        //  Each time the water cup is touched, 
        //  save its current level of water to the preferences store.
        userDefaults.set(index, forKey: Key)
    }
    
    @IBAction func btnReset_Click(_ sender: UIButton) {
        
        // reset button that cycles back to empty image.
        index = 0
        
        setImage(index: index)
        
        userDefaults.set(index, forKey: Key)
    }
    
    func setImage(index: Int){
        
        // Set image
        btnWater.setImage(waterImage[index], for: UIControlState.normal)
    }
    
}


//
//  ViewController.swift
//  TrafficLightGame
//
//  Created by Nurul Ahsan on 27/8/19.
//  Copyright © 2019 Nurul Ahsan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trafficimage: UIImageView!
    @IBOutlet weak var scorelabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    
    var startTimer = Timer()
    var scoreTimer = Timer()
    
    var timerInt = 0
    var scoreInt = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func startGame(_ sender: Any) {
        if scoreInt == 0
        {
            timerInt = 3
            trafficimage.image = UIImage(named: "trafficLight")
            startTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            scorelabel.text = String(scoreInt)
            startStopButton.isEnabled = false
            startStopButton.setTitle("", for: UIControlState.normal)
        }
        else
        {
            startTimer.invalidate()
            scoreInt = 0
            startStopButton.setTitle("Restart", for: UIControlState.normal)
        }
    }
    
    @objc func updateTimer ()
    {
        timerInt -= 1
        
        if timerInt == 2
        {
            trafficimage.image = UIImage(named: "trafficLight3")
        }
        else if timerInt == 1
        {
            trafficimage.image = UIImage(named: "trafficLight2")
        }
        else if timerInt == 0
        {
            trafficimage.image = UIImage(named: "trafficLight1")
            startTimer.invalidate()
            startTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(updateScoreTimer), userInfo: nil, repeats: true)
            startStopButton.isEnabled = true
            startStopButton.setTitle("Stop", for: UIControlState.normal)
        }
    }
    
    @objc func updateScoreTimer()
    {
        scoreInt += 1
        scorelabel.text = String(scoreInt)
    }
    

}


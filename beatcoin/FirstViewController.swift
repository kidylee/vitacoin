//
//  FirstViewController.swift
//  beatcoin
//
//  Created by An Li on 3/15/18.
//  Copyright © 2018 An Li. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var rate: UILabel!
    
    @IBOutlet weak var heart: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        newBeat()
        
        Timer.scheduledTimer(timeInterval: 1*60/65,
                             target: self,
                             selector: #selector(newBeat),
                             userInfo: nil,
                             repeats: true)
        FirstViewController.beat(self.heart, bmp: Double(self.bpm))
        
        
    }
    
    @IBAction func test(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {
            self.heart.frame.origin.y -= 20
        }, completion: nil)
    }
    var count = 0
    
    var bpm = 80.0
    
    
    
    @objc func newBeat() {
        count = count + 1
        rate.text = "\(count)"
    }
    
    static func beat(_ view: UIView, bmp: Double) {
        
        let shrinkFactor = CGFloat(2.0 / 3)
        var expandFactor: CGFloat {
            return 1.0 / shrinkFactor
        }
        
        var duration: Double {
            return 60.0 / Double(bmp)
        }
        // 1
        UIView.animate(withDuration: duration / 2,
                       delay: 0.0,
                       options: [.curveEaseIn,.curveEaseOut],
                       animations: {
                        // 2
                        view.transform =
                            view.transform.scaledBy(x: shrinkFactor, y: shrinkFactor)
        },
                       completion: { _ in
                        // 3
                        UIView.animate(withDuration: duration / 2,
                                       delay: 0.0,
                                       options: [.curveEaseIn,.curveEaseOut],
                                       animations: {
                                        // 4
                                        view.transform =
                                            view.transform.scaledBy(x: expandFactor, y: expandFactor)
                        },
                                       completion: { _ in
                                        // 5
                                        self.beat(view, bmp:bmp)
                        }
                        )
        }
        )
    }
    
}


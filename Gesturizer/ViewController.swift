//
//  ViewController.swift
//  Gesturizer
//
//  Created by Colin Masters on 2019-11-25.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gestureName: UILabel!
    
    @IBOutlet var singleTapRecognizer: UITapGestureRecognizer!
    @IBOutlet var doubleTapRecoqnizer: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        singleTapRecognizer.require(toFail: doubleTapRecoqnizer)
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            showGestureName(name: "Shake")
        }
    }

    @IBAction func singleTap(_ sender: Any) {
        showGestureName(name: "Single Tap")
    }
    
    @IBAction func doubleTap(_ sender: Any) {
        showGestureName(name: "Double Tap")
    }
    
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .right:
            showGestureName(name: "Right Swipe")
        case .left:
            showGestureName(name: "Left Swipe")
        case .up:
            showGestureName(name: "Swipe Up")
        case .down:
            showGestureName(name: "Swipe Down")
        default:
            print()
        }
    }
    
    func showGestureName(name: String) {
        gestureName.text = name
        UIView.animate(withDuration: 2, animations: {
            self.gestureName.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 1, animations: {self.gestureName.alpha = 0})
        }
    }
}

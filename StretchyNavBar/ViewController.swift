//
//  ViewController.swift
//  StretchyNavBar
//
//  Created by Erin Luu on 2016-12-08.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var navBarHeight: NSLayoutConstraint!
    
    @IBOutlet weak var plusButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        if navBarHeight.constant == 200 {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 20, options: .curveEaseIn, animations: {
                self.navBarHeight.constant = 64
                let transform = CGAffineTransform(rotationAngle: CGFloat(0))
                self.plusButton.layer.transform = CATransform3DMakeAffineTransform(transform)
                self.view.layoutIfNeeded()
            }, completion: {(finished) -> Void in
                // ....
            })
        }else {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 20, options: .curveEaseIn, animations: {
                self.navBarHeight.constant = 200
                let transform = CGAffineTransform(rotationAngle: CGFloat(95))
                self.plusButton.layer.transform = CATransform3DMakeAffineTransform(transform)
                self.view.layoutIfNeeded()
            }, completion: {(finished) -> Void in
                // ....
            })
            
        }
    }
}


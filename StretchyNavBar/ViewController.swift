//
//  ViewController.swift
//  StretchyNavBar
//
//  Created by Erin Luu on 2016-12-08.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

import UIKit

var defaultNavHeight: CGFloat = 64
var expandedNavHeight: CGFloat = 200


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: Properties
    @IBOutlet weak var navBarHeight: NSLayoutConstraint!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var candyCaneButton: UIButton!
    @IBOutlet weak var gingerBreadButton: UIButton!
    @IBOutlet weak var santaButton: UIButton!
    @IBOutlet weak var presentButton: UIButton!
    
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarHeight.constant = defaultNavHeight
        stackView.isHidden = true
    }
    
    //Stretchy Navigation
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        if navBarHeight.constant == expandedNavHeight {
            stackView.isHidden = true
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 20, options: .curveEaseIn, animations: {
                self.navBarHeight.constant = defaultNavHeight
                let transform = CGAffineTransform(rotationAngle: CGFloat(0))
                self.plusButton.layer.transform = CATransform3DMakeAffineTransform(transform)
                self.view.layoutIfNeeded()
            }, completion: {(finished) -> Void in })
        }else {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 20, options: .curveEaseIn, animations: {
                self.navBarHeight.constant = expandedNavHeight
                let transform = CGAffineTransform(rotationAngle: CGFloat(95))
                self.plusButton.layer.transform = CATransform3DMakeAffineTransform(transform)
                self.stackView.isHidden = false
                self.view.layoutIfNeeded()
            }, completion: {(finished) -> Void in })
        }
    }
    
    //Button Actions
    @IBAction func presentTapped(_ sender: UIButton) {
        items.insert("Christmas Present", at: 0)
        insertRowReload()
    }
    @IBAction func santaTapped(_ sender: UIButton) {
        items.insert("Santa Claus", at: 0)
        insertRowReload()
    }
    @IBAction func gingerbreadTapped(_ sender: UIButton) {
        items.insert("Gingerbread Man", at: 0)
        insertRowReload()
    }
    @IBAction func candycaneTapped(_ sender: UIButton) {
        items.insert("Candy Cane", at: 0)
        insertRowReload()
    }
    
    //MARK: Table Data Source and Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func insertRowReload() {
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableViewRowAnimation.middle)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        
        if items.count % 2 == 0
        {
            cell.backgroundColor = UIColor.init(red: 1.0, green: 0.5, blue: 0.5, alpha: 1)
        } else {
            cell.backgroundColor = UIColor.init(red: 1.0, green: 0.2, blue: 0.2, alpha: 1)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}


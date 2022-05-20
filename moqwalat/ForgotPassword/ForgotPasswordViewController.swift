//
//  ForgotPasswordViewController.swift
//  moqwalat
//
//  Created by Nasr on 18/05/2022.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var topImageConstriant: NSLayoutConstraint!
    @IBOutlet weak var heightImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var topFIrstLabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var topSecondLabelConstarint: NSLayoutConstraint!
    @IBOutlet weak var rightSecondLabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftSecondLabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var topPhoneLabelConstarint: NSLayoutConstraint!
    @IBOutlet weak var rightPhoneLabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var topPhoneTxtConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftPhoneTxtConstraint: NSLayoutConstraint!
    @IBOutlet weak var topLoginButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var heighPhoneTxtConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        print(topImageConstriant.constant)
        print(self.view.bounds.height)
        setupConstraint()
        
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
    }

    deinit {
       NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }

    @objc func rotated() {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
        } else {
            print("Portrait")
        }
    }

    
    func setupConstraint(){
        let heightView = self.view.frame.height //812
        let widthView = self.view.frame.width // 375
        
        topImageConstriant.constant = heightView * (topImageConstriant.constant / 812)
       // 0.049
        heightImageConstraint.constant = heightView * 0.167
        widthImageConstraint.constant = widthView * 0.325
        topFIrstLabelConstraint.constant = heightView * 0.022
        topSecondLabelConstarint.constant = heightView * 0.025
        rightSecondLabelConstraint.constant = widthView * 0.181
        leftSecondLabelConstraint.constant = widthView * 0.181
        topPhoneLabelConstarint.constant = heightView * 0.041
        rightPhoneLabelConstraint.constant = widthView * 0.08
        topPhoneTxtConstraint.constant = heightView * 0.014
        leftPhoneTxtConstraint.constant = widthView * 0.08
        heighPhoneTxtConstraint.constant = heightView * 0.049
        topLoginButtonConstraint.constant = heightView * 0.032
    }
}

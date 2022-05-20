//
//  VerificationSuccessViewController.swift
//  moqwalat
//
//  Created by Nasr on 20/05/2022.
//

import UIKit

class VerificationSuccessViewController: UIViewController {

    
    @IBOutlet weak var topImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var topButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var topFirstLabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var topSecondLabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightButtonConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
 
        setupConstraint()
    }
    
    func setupConstraint(){
        
        let heightView = self.view.frame.height
        let widthView = self.view.frame.width
        let height: CGFloat = 812
        let width: CGFloat = 375
        
        topImageConstraint.constant = heightView * (topImageConstraint.constant / height)
        leftImageConstraint.constant = widthView * (leftImageConstraint.constant / width)
        rightImageConstraint.constant = widthView * (rightImageConstraint.constant / width)
        topButtonConstraint.constant = heightView * (topButtonConstraint.constant / height)
        topFirstLabelConstraint.constant = heightView * (topFirstLabelConstraint.constant / height)
        topSecondLabelConstraint.constant = heightView * (topSecondLabelConstraint.constant / height)
        leftButtonConstraint.constant = widthView * (leftButtonConstraint.constant / width)
        heightButtonConstraint.constant = heightView * (heightButtonConstraint.constant / height)
        rightButtonConstraint.constant = widthView * (rightButtonConstraint.constant / width)
    }
}

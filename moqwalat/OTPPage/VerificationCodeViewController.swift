//
//  VerificationCodeViewController.swift
//  moqwalat
//
//  Created by Nasr on 20/05/2022.
//

import UIKit

class VerificationCodeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var topImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var topFirstLabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightFirstLabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthFirstLabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var topStackCodeConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightOfTxtCodeConstraint: NSLayoutConstraint!
    @IBOutlet weak var topResendStackConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightResendStackConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthResendStackConstraint: NSLayoutConstraint!
    @IBOutlet weak var topWillSendCodeLabelConstrint: NSLayoutConstraint!
    @IBOutlet weak var topSecondStackConstrint: NSLayoutConstraint!
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourthTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraint()
        setupTextField()
    }
    
    func setupTextField(){
        firstTextField.delegate = self
        secondTextField.delegate = self
        thirdTextField.delegate = self
        fourthTextField.delegate = self
        
        firstTextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        secondTextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        thirdTextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        fourthTextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        
        firstTextField.becomeFirstResponder()

    }
    
    func setupConstraint(){
        
        let heightView = self.view.frame.height
        let widthView = self.view.frame.width
        let height: CGFloat = 812
        let width: CGFloat = 375
        
        topImageConstraint.constant = heightView * (topImageConstraint.constant / height)
        topFirstLabelConstraint.constant = heightView * (topFirstLabelConstraint.constant / height)
        heightFirstLabelConstraint.constant = heightView * (heightFirstLabelConstraint.constant / height)
        widthFirstLabelConstraint.constant = widthView * (widthFirstLabelConstraint.constant / width)
        topStackCodeConstraint.constant = heightView * (topStackCodeConstraint.constant / height)
        topResendStackConstraint.constant = heightView * (topResendStackConstraint.constant / height)
        heightResendStackConstraint.constant = heightView * (heightResendStackConstraint.constant / height)
        topWillSendCodeLabelConstrint.constant = heightView * (topWillSendCodeLabelConstrint.constant / height)
        topSecondStackConstrint.constant = heightView * (topSecondStackConstrint.constant / height)
        widthResendStackConstraint.constant = widthView * (widthResendStackConstraint.constant / width)
    }
}


extension VerificationCodeViewController: UITextFieldDelegate{
    
    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        //-----------------------------------------------------------------------------------
        // when text lenght equal to 1
        //-----------------------------------------------------------------------------------
        if  text?.count == 1 {
            switch textField{
            case firstTextField:
                secondTextField.becomeFirstResponder()
            case secondTextField:
                thirdTextField.becomeFirstResponder()
            case thirdTextField:
                fourthTextField.becomeFirstResponder()
            case fourthTextField:
                fourthTextField.resignFirstResponder()
                self.dismissKeyboard()
            default:
                break
            }
        }
        
        if  text?.count == 0 {
            switch textField{
            case firstTextField:
                firstTextField.becomeFirstResponder()
            case secondTextField:
                firstTextField.becomeFirstResponder()
            case thirdTextField:
                secondTextField.becomeFirstResponder()
            case fourthTextField:
                thirdTextField.becomeFirstResponder()
            default:
                break
            }
        }
    }
    
    func dismissKeyboard(){
        self.view.endEditing(true)
    }

}

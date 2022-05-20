//
//  ViewController.swift
//  moqwalat
//
//  Created by Nasr on 18/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    var lastIndexActive:IndexPath = [1 ,0]
    let arr = ["Ahmed", "Nasr", "Saied", "Mohamed", "Ali"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        myCollectionView.register(MyCollectionViewCell.Nib(), forCellWithReuseIdentifier: MyCollectionViewCell.id)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as! MyCollectionViewCell
        
        
        //5
        if indexPath.row == arr.count{
            cell.nameLabel.text = "Adel"
        }else{
            cell.nameLabel.text = arr[indexPath.row]
        }
        
        cell.myView.playWithView(backgroundColor: .white, cornerRadius: 6, shadowColor: UIColor.lightGray.cgColor, shadowOffset: CGSize(width: 0.0, height: 0.0), shadowRadius: 5.0, shadowOpacity: 0.8)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.393, height:  self.view.frame.width * 0.45)
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 20
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
     }
}

extension ViewController{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cellWithClick = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        
        cellWithClick.myView.layer.borderColor = getUIColor(hex: "#ec562c")?.cgColor
        cellWithClick.myView.layer.borderWidth = 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cellWithoutClick = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        
        cellWithoutClick.myView.layer.borderColor = UIColor.white.cgColor
        cellWithoutClick.myView.layer.borderWidth = 2
    }
    
    
    //put in helper file
    func getUIColor(hex: String, alpha: Double = 1.0) -> UIColor? {
        var cleanString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cleanString.hasPrefix("#")) {
            cleanString.remove(at: cleanString.startIndex)
        }

        if ((cleanString.count) != 6) {
            return nil
        }

        var rgbValue: UInt32 = 0
        Scanner(string: cleanString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}


//put in extension file
extension UIView{
    func playWithView(backgroundColor: UIColor?, cornerRadius: CGFloat?, shadowColor: CGColor?, shadowOffset: CGSize?, shadowRadius: CGFloat?, shadowOpacity: Float?){
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius ?? 0
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = shadowOffset ?? CGSize(width: 0, height: 0)
        self.layer.shadowRadius = shadowRadius ?? 0
        self.layer.shadowOpacity = shadowOpacity ?? 0
    }
}

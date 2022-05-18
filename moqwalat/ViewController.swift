//
//  ViewController.swift
//  moqwalat
//
//  Created by Nasr on 18/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as! MyCollectionViewCell
        
        /*
         cardView.backgroundColor = .white

         cardView.layer.cornerRadius = 10.0

         cardView.layer.shadowColor = UIColor.gray.cgColor

         cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)

         cardView.layer.shadowRadius = 6.0

         cardView.layer.shadowOpacity = 0.7
         */
        cell.myView.backgroundColor = .white
        cell.myView.layer.cornerRadius = 6
        cell.myView.layer.shadowColor = UIColor.lightGray.cgColor
        cell.myView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cell.myView.layer.shadowRadius = 5.0
        cell.myView.layer.shadowOpacity = 0.8
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.393, height:  self.view.frame.width * 0.45)
     }
     
//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//         return 12
//     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 20
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
     }
}

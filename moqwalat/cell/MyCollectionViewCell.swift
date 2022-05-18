//
//  MyCollectionViewCell.swift
//  moqwalat
//
//  Created by Nasr on 18/05/2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myView: UIView!
    static let id = "MyCollectionViewCell"
    static func Nib() -> UINib{
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

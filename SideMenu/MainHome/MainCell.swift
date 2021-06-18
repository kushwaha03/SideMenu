//
//  MainCell.swift
//  SideMenu
//
//  Created by Krishna Kushwaha on 17/06/21.
//

import Foundation
import UIKit

protocol CollectionItemDelegate {
    func selectedCell(_ row: Int)
}


class MainCell: UITableViewCell {

    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var titleNMLbl: UILabel!
    var delegate: CollectionItemDelegate?

    @IBOutlet weak var collectionView: UICollectionView!
    var categoriesColl = ["1", "2", "3", "4", "5","6", "7","8","9","10"]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension MainCell : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesColl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let homeCollnCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollnCell", for: indexPath) as!  MainCollCell
        homeCollnCell.titleLbl.text = "Name: " + categoriesColl[indexPath.row]
        homeCollnCell.cellBtn.tag = indexPath.row
        homeCollnCell.cellBtn.addTarget(self, action: #selector(actionBtn(sender:)), for: .touchUpInside)
        
        return homeCollnCell
        
    }
    
    @objc func actionBtn(sender: UIButton) {
        print("indexPAth", sender.tag)
        print("print")
        
    }

    
    
    
    
}
extension MainCell : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 4
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height-20)
    }
    
}

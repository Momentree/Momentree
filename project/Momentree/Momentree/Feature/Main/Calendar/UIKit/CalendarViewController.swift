//
//  CalendarViewController.swift
//  Momentree
//
//  Created by 정성희 on 11/23/24.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var calendarCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        
        // 아이템 하나당 사이즈 설정
//        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 0.5 , height: 200)
//        // 아이템 끼리의 "가로" 사이 간격
//        layout.minimumInteritemSpacing = 1
//        layout.minimumLineSpacing = 1
//        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        // photoCollectionView에 layout 적용
        calendarCollectionView.collectionViewLayout = layout
        
        calendarCollectionView.dataSource = self
        calendarCollectionView.delegate = self
    }
}

extension CalendarViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 31
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCollectionViewCell", for: indexPath)as! CalendarCollectionViewCell
        
        cell.configureLabel(text: "0")
 
        return cell
    }
}


//
//  WallpaperListContainerViewController.swift
//  Wallpaper-App
//
//  Created by Ahmer Hassan on 07/03/2022.
//

import UIKit

class WallpaperListContainerViewController: UIViewController {

    @IBOutlet weak var wallpapersCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        wallpapersCollectionView.delegate = self
        wallpapersCollectionView.dataSource = self
        setupViews()
    }
    
    func setupViews() {
        let nib = UINib(nibName: "WallpapersCollectionViewCell", bundle: nil)
        wallpapersCollectionView.register(nib, forCellWithReuseIdentifier: "WallpapersCollectionViewCell")
    }

}

extension WallpaperListContainerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let viewModel = WallpapersCollectionViewCellViewModel()
        let cell = wallpapersCollectionView.dequeueReusableCell(withReuseIdentifier: "WallpapersCollectionViewCell", for: indexPath) as! WallpapersCollectionViewCell
        cell.configure(viewModel: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let noOfCellsInRow = 3
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            return CGSize(width: size, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

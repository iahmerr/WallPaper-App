//
//  WallpapersCollectionViewCell.swift
//  Wallpaper-App
//
//  Created by Ahmer Hassan on 06/03/2022.
//

import UIKit

class WallpapersCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var wallpaperImage: UIImageView!
    @IBOutlet weak var blurView: UIView!
    
    private var viewModel: WallpapersCollectionViewCellViewModel?
    
    func configure(viewModel: WallpapersCollectionViewCellViewModel) {
        self.viewModel = viewModel
        setupViews()
    }
    
    @IBAction func favouriteButton(_ sender: Any) {
    }
}

extension WallpapersCollectionViewCell {
    
    func setupViews() {
        blurView.layer.cornerRadius = 10
    }
    
    func bind() {
        
    }
}

//
//  HorizontalTilesCollectionViewCell.swift
//  Wallpaper-App
//
//  Created by Ahmer Hassan on 07/03/2022.
//

import UIKit
import Combine

class HorizontalTilesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    private var subscriptions = Set<AnyCancellable>()
    private var viewModel: HorizontalTilesCollectionViewCellViewModel?
    
    func configure(viewModel: HorizontalTilesCollectionViewCellViewModel) {
        self.viewModel = viewModel
        bindViews()
        setupViews()
    }
    
    func setupViews() {
        cardView.layer.cornerRadius = 10
    }
}
extension HorizontalTilesCollectionViewCell {
    
    func bindViews() {
        viewModel?.title
            .assign(to: \.text, on: titleLabel)
            .store(in: &subscriptions)
    }
}

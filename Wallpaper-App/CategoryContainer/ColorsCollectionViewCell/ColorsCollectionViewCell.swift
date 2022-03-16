//
//  ColorsCollectionViewCell.swift
//  Wallpaper-App
//
//  Created by Ahmer Hassan on 07/03/2022.
//

import UIKit

class ColorsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var colorView: UIView!
    
    private var viewModel: ColorsCollectionViewCellViewModel?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        outerView.roundView(withBorderColor: UIColor.appColor(ofType: .tileSoft), withBorderWidth: 1.5)
        colorView.roundView()
    }
    
    func configure(viewModel: ColorsCollectionViewCellViewModel) {
        self.viewModel = viewModel
        setupViews()
    }
    
    func setupViews() {
       // blurView.layer.cornerRadius = 10
    }
    
    func bind() {
        
    }

}

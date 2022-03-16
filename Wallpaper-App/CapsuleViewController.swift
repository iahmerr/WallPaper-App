//
//  CapsuleViewController.swift
//  Wallpaper-App
//
//  Created by Ahmer Hassan on 10/03/2022.
//

import UIKit

class CapsuleViewController: UIViewController {

    @IBOutlet weak var capsuleView: UIView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var capsuleViewWidth: NSLayoutConstraint!
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        capsuleView.layer.cornerRadius = 15
        capsuleViewWidth.constant = button1.frame.width
    }
    
    
    func animateView(to button: UIButton) {
        UIView.animate(withDuration: 1.0) {[weak self] in
            guard let self = self else { return }
            self.capsuleView.transform = CGAffineTransform(translationX: (button.frame.minX) , y: 0)
        }
    }
    @IBAction func cell1(_ sender: UIButton) {
        animateView(to: sender)
    }
}

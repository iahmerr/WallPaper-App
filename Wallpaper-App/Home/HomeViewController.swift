//
//  ViewController.swift
//  Wallpaper-App
//
//  Created by Ahmer Hassan on 04/03/2022.
//

import UIKit
import Combine

class HomeViewController: UIViewController{
    
    @IBOutlet weak var capsuleView: UIView!
    let viewModel = HomeViewModel()
    private var subscriptions = Set<AnyCancellable>()
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var latestButton: UIButton!
    @IBOutlet weak var popularButton: UIButton!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var capsuleWidth: NSLayoutConstraint!
    
    private var selectedCell = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        capsuleView.backgroundColor = UIColor.red.withAlphaComponent(0.1)
        capsuleView.layer.cornerRadius = capsuleView.frame.height/2
        capsuleWidth.constant = categoryButton.frame.width
    }
    
    @IBAction func tabSelected(_ sender: UIButton) {
        viewModel.tabSelectedSubject.send(sender.tag)
        animateView(to: sender)
    }
    
}

extension HomeViewController {
    
    func animateView(to button: UIButton) {
        UIView.animate(withDuration: 0.3) {[weak self] in
            guard let self = self else { return }
            self.capsuleView.transform = CGAffineTransform(translationX: (button.frame.minX) , y: 0)
        }
    }
    
    func bind() {
        
    }
}





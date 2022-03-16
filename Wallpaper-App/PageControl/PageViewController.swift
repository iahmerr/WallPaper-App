//
//  PageViewController.swift
//  Wallpaper-App
//
//  Created by Ahmer Hassan on 08/03/2022.
//

import UIKit
import Combine

class PageViewController: UIPageViewController {

    let subviews: [UIViewController] = [
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CategoryContainerViewController") as! CategoryContainerViewController,
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WallpaperListContainerViewController") as! WallpaperListContainerViewController
    ]
    private var subscriptions = Set<AnyCancellable>()
    let viewModel: PagingViewModel = PagingViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        bind()
        setViewControllers([subviews[0]], direction: .forward, animated: true)
    }
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }

}

extension PageViewController:  UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
        func presentationCount(for pageViewController: UIPageViewController) -> Int {
            subviews.count
        }
    
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            let currentIndex = subviews.firstIndex(of: viewController) ?? 0
    
            if currentIndex <= 0 {
                return nil
            }
            return subviews[currentIndex - 1]
        }
    
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            let currentIndex = subviews.firstIndex(of: viewController) ?? 0
    
            if currentIndex >= (subviews.count - 1) {
                return nil
            }
            return subviews[currentIndex + 1]
        }
    
    func bind() {
    
        viewModel.cityName.sink(receiveValue: {
            print($0)
        }).store(in: &subscriptions)
    }
    
}

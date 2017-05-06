//
//  OnBoardingController.swift
//  My Mind
//
//  Created by Alexander Davis on 30/03/2017.
//  Copyright © 2017 Alexander Davis. All rights reserved.
//

import Foundation
import UIKit

class OnBoardingController : UIPageViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        // Set the dataSource and delegate in code.
        // I can't figure out how to do this in the Storyboard!
        dataSource = self
        delegate = self
        // This is the starting point.  Start with step zero.
        setViewControllers([getPageOne()], direction: .forward, animated: false, completion: nil)
    }
    
    func getPageOne() -> PageOne {
        return storyboard!.instantiateViewController(withIdentifier: "WelcomeScreenOne") as! PageOne
    }
    
    func getPageTwo() -> PageTwo {
        return storyboard!.instantiateViewController(withIdentifier: "WelcomeScreenTwo") as! PageTwo
    }
    
    func getPageThree() -> PageThree {
        return storyboard!.instantiateViewController(withIdentifier: "WelcomeScreenThree") as! PageThree
    }
    
}

// MARK: - UIPageViewControllerDataSource methods

extension OnBoardingController : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: PageTwo.self) {
            // 2 -> 1
            return getPageTwo()
        } else if viewController.isKind(of: PageTwo.self) {
            // 1 -> 0
            return getPageOne()
        } else {
            // 0 -> end of the road
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: PageOne.self) {
            // 0 -> 1
            return getPageTwo()
        } else if viewController.isKind(of: PageTwo.self) {
            // 1 -> 2
            return getPageThree()
        } else {
            // 2 -> end of the road
            return nil
        }
    }
    
    
    // This only gets called once, when setViewControllers is called
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}

// MARK: - UIPageViewControllerDelegate methods

extension OnBoardingController : UIPageViewControllerDelegate {
    
}

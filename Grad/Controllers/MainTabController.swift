//
//  MainTabController.swift
//  Grad
//
//  Created by Oscar Garcia Vazquez on 10/9/20.
//

import UIKit

class MainTabController : UITabBarController {
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        authenticateUser()
        tabBar.tintColor = .clear
    }
    
    //MARK: - Helpers
    
    func authenticateUser() {
        print("made it to authentication")
        print("toke is \(currentUser.currUser?.token)")
        print(currentUser.currUser?.token != nil )
        if currentUser.currUser?.token == nil {
            configureViewControllers()
        } else {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: RegistrationController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
    
    func configureViewControllers() {
        let home = SchoolSearchController()
        let nav1 = templateNavigationController(image: UIImage(named: "progressGrad")!, rootViewController: home)
        
        let progress = StudentProgressController()
        let nav2 = templateNavigationController(image: UIImage(named: "SearchGrad")!, rootViewController: progress)
        
        let schools = SchoolOptionsController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav3 = templateNavigationController(image: UIImage(named: "SearchGrad")!, rootViewController: schools)
        
        viewControllers = [nav2, nav1, nav3]
    }
    
    func templateNavigationController(image : UIImage, rootViewController : UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        
        return nav
    }
    
    //MARK: - Selectors
    
    //MARK: - API
}

//
//  LivePostRouter.swift
//  RedDoorz
//
//  Created by Praveen Singh on 13/04/18.
//  Copyright © 2018 Praveen Singh. All rights reserved.
//
import Foundation
import UIKit

class LivePostRouter: PresenterToRouterProtocol{
    
    class func createModule() ->UIViewController{
        let navController = mainstoryboard.instantiateViewController(withIdentifier: "navController")
        if let view = navController.childViewControllers.first as? LivePostViewController {
        let presenter: ViewToPresenterProtocol & InterectorToPresenterProtocol = LivePostPresenter()
        let interactor: PresentorToInterectorProtocol = LivePostInterector()
        let router: PresenterToRouterProtocol = LivePostRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interector = interactor
        interactor.presenter = presenter
        return navController
        
        }
        
        return UIViewController()
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func presentPostDetailScreen(from view: PresenterToViewProtocol, forPost post: LivePostModel) {
        let postDetailViewController = PostDetailWireFrame.createPostDetailModule(forPost: post)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(postDetailViewController, animated: true)
        }
    }
}

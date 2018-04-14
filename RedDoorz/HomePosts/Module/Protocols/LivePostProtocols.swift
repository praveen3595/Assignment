//
//  LivePostProtocols.swift
//  RedDoorz
//
//  Created by Praveen Singh on 13/04/18.
//  Copyright © 2018 Praveen Singh. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToViewProtocol: class{
    func showPost(post: [LivePostModel])
    func showError()
}

protocol InterectorToPresenterProtocol: class{
    func livePostFetched(post: [LivePostModel])
    func livePostFetchedFailed()
}

protocol PresentorToInterectorProtocol: class{
    var presenter: InterectorToPresenterProtocol? {get set}
    func fetchLivePost()
}

protocol ViewToPresenterProtocol: class{
    var view: PresenterToViewProtocol? {get set}
    var interector: PresentorToInterectorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func updateView()
    func showPostDetail(forPost post: LivePostModel)
}

protocol PresenterToRouterProtocol: class{
    static func createModule() -> UIViewController;
    func presentPostDetailScreen(from view: PresenterToViewProtocol, forPost post: LivePostModel)
}

//
//  PostDetailProtocols.swift
//  RedDoorz
//
//  Created by Praveen Singh on 13/04/18.
//  Copyright © 2018 Praveen Singh. All rights reserved.
//

import UIKit

protocol PostDetailViewProtocol: class {
    var presenter: PostDetailPresenterProtocol? { get set }
    func showPostDetail(forPost post: LivePostModel)
}

protocol PostDetailWireFrameProtocol: class {
    static func createPostDetailModule(forPost post: LivePostModel) -> UIViewController
}

protocol PostDetailPresenterProtocol: class {
    var view: PostDetailViewProtocol? { get set }
    var wireFrame: PostDetailWireFrameProtocol? { get set }
    var post: LivePostModel? { get set }
    
    func viewDidLoad()
}

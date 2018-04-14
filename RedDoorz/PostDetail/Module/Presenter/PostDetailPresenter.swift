//
//  PostDetailPresenter.swift
//  RedDoorz
//
//  Created by Praveen Singh on 13/04/18.
//  Copyright © 2018 Praveen Singh. All rights reserved.
//

class PostDetailPresenter: PostDetailPresenterProtocol {
    
    weak var view: PostDetailViewProtocol?
    var wireFrame: PostDetailWireFrameProtocol?
    var post: LivePostModel?
    
    func viewDidLoad() {
        view?.showPostDetail(forPost: post!)
    }
    
}

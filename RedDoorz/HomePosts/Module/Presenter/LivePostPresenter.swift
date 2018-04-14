//
//  LivePostPresenter.swift
//  RedDoorz
//
//  Created by Praveen Singh on 13/04/18.
//  Copyright © 2018 Praveen Singh. All rights reserved.
//

import Foundation

class LivePostPresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?;
    var interector: PresentorToInterectorProtocol?;
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        interector?.fetchLivePost()
    }
    
    
    
    func showPostDetail(forPost post: LivePostModel) {
        router?.presentPostDetailScreen(from: view!, forPost: post)
    }
}

extension LivePostPresenter: InterectorToPresenterProtocol {
	
	func livePostFetched(post: [LivePostModel]) {
        view?.showPost(post: post)
    }
    
    func livePostFetchedFailed(){
        view?.showError()
    }
}


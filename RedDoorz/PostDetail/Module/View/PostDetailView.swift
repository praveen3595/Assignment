//
//  PostDetailView.swift
//  RedDoorz
//
//  Created by Praveen Singh on 13/04/18.
//  Copyright © 2018 Praveen Singh. All rights reserved.
//

import UIKit

class PostDetailView: UIViewController {
    
    
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var descLabel: UILabel!
    
    var presenter: PostDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension PostDetailView: PostDetailViewProtocol {
    
    func showPostDetail(forPost post: LivePostModel) {
        descLabel?.text = post.description
        if let urlstring = post.urlToImage{
            let url = URL(string: urlstring)!
            let placeholderImage = UIImage(named: "placeholder")!
            postImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
        }
    }
    
}

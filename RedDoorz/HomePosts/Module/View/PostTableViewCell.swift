//
//  PostTableViewCell.swift
//  RedDoorz
//
//  Created by Praveen Singh on 13/04/18.
//  Copyright © 2018 Praveen Singh. All rights reserved.
//

import UIKit
import AlamofireImage

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var lblAuthor: UILabel!
    func set(forPost post: LivePostModel) {
        self.selectionStyle = .none
        titleLabel?.text = post.title
        lblAuthor.text = post.author
        print("url = ",post.urlToImage ?? "nil")
        if let urlstring = post.urlToImage{
            let url = URL(string: urlstring)!
            let placeholderImage = UIImage(named: "placeholder")!
            postImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
        }
        
    }
}

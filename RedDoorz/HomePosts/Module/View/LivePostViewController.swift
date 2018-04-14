//
//  LivePostViewController.swift
//  RedDoorz
//
//  Created by Praveen Singh on 13/04/18.
//  Copyright © 2018 Praveen Singh. All rights reserved.
//

import UIKit
import Alamofire

class LivePostViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var presenter: ViewToPresenterProtocol?
    var dataList : [LivePostModel] = []
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        tblView.rowHeight = UITableViewAutomaticDimension
        tblView.estimatedRowHeight = 300
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension LivePostViewController: PresenterToViewProtocol {

	func showPost(post: [LivePostModel]) {
        let datamodel = post[0]
        dataList = post
        print("url = ",datamodel.url ?? "nil")
        tblView.reloadData()
        indicator.stopAnimating()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Posts", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


// Tableview Delegate and datasource
extension LivePostViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PostTableViewCell
        let post = dataList[indexPath.row]
        cell.set(forPost: post)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count here",dataList.count)
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showPostDetail(forPost: dataList[indexPath.row])
    }
    
}

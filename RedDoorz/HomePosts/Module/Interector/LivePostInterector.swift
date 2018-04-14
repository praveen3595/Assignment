//
//  LivePostInterector.swift
//  RedDoorz
//
//  Created by Praveen Singh on 13/04/18.
//  Copyright © 2018 Praveen Singh. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class LivePostInterector: PresentorToInterectorProtocol{

    var presenter: InterectorToPresenterProtocol?
    
    
    func fetchLivePost() {
        Alamofire.request(Constants.URL).responseJSON { response in
            if(response.response?.statusCode == 200){
                if let json = response.result.value as AnyObject? {
                    let arrayResponse = json["articles"] as! NSArray
                    let arrayObject = Mapper<LivePostModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
                    self.presenter?.livePostFetched(post: (arrayObject))
                }
            }
            else {
                self.presenter?.livePostFetchedFailed()
            }
        }
    }
}

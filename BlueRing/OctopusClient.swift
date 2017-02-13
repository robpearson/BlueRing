//
//  OctopusService.swift
//  BlueRing
//
//  Created by Robert Pearson on 11/2/17.
//  Copyright © 2017 Rob Pearson. All rights reserved.
//

import Cocoa
import RxSwift
import Foundation

class OctopusClient: NSObject {

    public func getAllProjects() -> Observable<String> {
        
        let session = URLSession.shared
        let url = URL(string: "https://demo.octopus.com/api/projects/all?apiKey=API-GUEST") // hard coded for now
        
        let observable = Observable<String>.create { observer in
            
            let task = session.dataTask(with: url!) { data, response, err in
                
                if let error = err {
                    // TODO: Handle errors nicely
                    print("octopus api error: \(error)")
                }
                
                // then check the response code
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 200: // all good!
                        let dataString = String(data: data!, encoding: String.Encoding.utf8)
                        observer.onNext(dataString!)
                        observer.onCompleted()
                    case 401: // unauthorized
                        print("octopus api returned an 'unauthorized' response. Did you forget to set your API key?")
                    default:
                        print("octopus api returned response: %d %@", httpResponse.statusCode, HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))
                    }
                }
            }
            task.resume()
            
            return Disposables.create  {
                task.cancel()
            }
            
            }
        
        return observable
        
    }
    
}

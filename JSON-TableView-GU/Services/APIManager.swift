//
//  APIManager.swift
//  JSON-TableView-GU
//
//  Created by Jaimin Raval on 20/03/26.
//

import Foundation


final class APIManager {
    
    public static let shared = APIManager()
    
    func callAPI() {
        
        //    Step-0
        //  API End-Point URL string
        let urlstr = "https://official-joke-api.appspot.com/jokes/random/25"
        
        //    Step-1
        // Validating URL:
        if let url = URL(string: urlstr) {
            
            //    Step-2
            // creating URLSession
            let session = URLSession.shared
            //    Step-3
            // initiating dataTask
            let dataTask = session.dataTask(with: url) { data, res, err in
                
                guard let jsonData = data else {return}
                do {
                    // Step-4:
                    //  decoding JSONDecoder
                    //  using in-built func() called .decode() from JSONDecoder Class.
                    let decodedData = try JSONDecoder().decode([JokeModel].self, from: jsonData)
                    print(decodedData)
                    //  print() this to see raw data, URLresponse and error.
                    //      print(data)
                    //      print(res)
                    //      print(err)
                } catch (let err) {
                    //  localizedDescription helps to read error in more human readable way.
                    print(err.localizedDescription)
                }
                
            }
            //  API code doesnt works
            dataTask.resume()
        } else {
            //  check url if this get prints
            print("URL is invalid")
        }
    }
}

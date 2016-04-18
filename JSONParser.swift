//: JSON Parser Playground - Retrieve JSON response from Github search. Parse response and print.

import Foundation
var searchTerm = "Parsing JSON in Swift"
if let search = searchTerm.stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet()) {
    if let endpoint = NSURL(string: "https://api.github.com/search/repositories?q=\(search)"){
        if let data = NSData(contentsOfURL: endpoint){
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                if let items = json["items"] as? [[String: AnyObject]] {
                    for item in items {
                        if let fullName = item["full_name"] as? String {
                            print("\(fullName)")
                        }
                    }
                }
            } catch {
                print(error)
            }
        }
    }
}

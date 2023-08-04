//
//  ViewController.swift
//  URLSessionDemo
//
//  Created by Kumaran on 11/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var productsListTableView: UITableView!
    
    var productsListArray = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProductsList()
    }
}

extension ViewController {
    
    func getProductsList() {
        guard let listUrl = URL(string: "https://dummyjson.com/products") else { return }
        
        var request = URLRequest(url: listUrl)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil {
                if let data = data  {
                    do {
//                        let jsonData = try JSONSerialization.jsonObject(with: data , options: .fragmentsAllowed) 
                        let jsonData = try JSONDecoder().decode(Product.self, from: data)
                        dump(jsonData)
                    } catch {
                        
                    }
                }
            } else {
                dump(error)
            }
           
        }
        dataTask.resume()
    }
}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(product: productsListArray[indexPath.row])
        return cell
    }
}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


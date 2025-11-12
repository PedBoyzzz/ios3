//
//  ViewController.swift
//  Project16
//
//  Created by Niwat on 25/6/2567 BE.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var viewModel:ViewModel?
    var data:[Product]?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let d = data{
            return d.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "c", for: indexPath) as! Cell
        cell.selectionStyle = .none
        let product = self.data![indexPath.row]
        let boldText = product.title
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        //cell.title.text = product.title
        cell.title.attributedText = attributedString
        
        let string = product.title
        
        
        cell.des.text = product.description
        cell.price.text = String(product.price)
        cell.des.numberOfLines = 0
        cell.price.numberOfLines = 0
        URLSession.shared.dataTask(with: NSURL(string: product.image)! as URL, completionHandler: { data, response, error in
                    if error != nil {
                        print(error ?? "No Error")
                        return
            }
            DispatchQueue.main.async {
                if let imageData = data{
                    if let uiImage  = UIImage(data:imageData) {
                        cell.img.image = uiImage
                    }
                }
            }
        }).resume()
    
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("----six item")
    }
    @IBOutlet weak var tb: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("----init push")
        print("----init push pipi")
        print("----init push pipi2")
        tb.delegate = self
        tb.dataSource = self
        self.tb.separatorStyle = UITableViewCell.SeparatorStyle.none
        let apiService = ApiService()
        viewModel = ViewModel(apiService: apiService)
        viewModel?.getAmazonProducts(url:"https://fakestoreapiserver.reactbd.com/amazonproducts",params:["":""],result:{it in
                self.data = it
                self.tb.reloadData()
                print("----- result len = \(it.count)")
        } )
        // Do any additional setup after loading the view.
    }


}


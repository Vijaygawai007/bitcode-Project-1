//
//  HomeTabBar.swift
//  bitcode-Project-1
//
//  Created by Prince's Mac on 15/04/23.
//


import UIKit
import Alamofire
import SDWebImage

class HomeTabBar : UIViewController {

    @IBOutlet weak var myTable: UITableView!
    
    var new = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable.delegate = self
        
        //MARK: - IF API IS NOT DECODE THEN THIS CONDITION IS CALL.
        if new.count == nil{
            do{
                print("your internet connection is not connected.")
            }catch{
                download()
            }
        }
    }
//    // MARK: - ALAMOFIRE TO PHARSE THE NESTED API.
    func download(){
        let url = "https://dummyjson.com/products"
        AF.request(url, method: .get, encoding: JSONEncoding.default).response{ response in
            print(response)
            do {
                let one = try? JSONDecoder().decode(Welcome.self, from: response.data!)
                print(one)
                self.new = one!.products
                print(self.new)
                self.myTable.reloadData()
            }catch{
                print(error.localizedDescription)
            }
        }
        
    }
}

extension HomeTabBar : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return new.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeTabCell = myTable.dequeueReusableCell(withIdentifier: "homeTabCell", for: indexPath)as! homeTabCell
        homeTabCell.cellview.layer.cornerRadius = 10
        homeTabCell.cellview.layer.shadowOffset = CGSize(width: 4, height: 4)
        homeTabCell.descriptionLabel_1.text = "\(new[indexPath.row].description)"
        homeTabCell.priceLabel_1.text = "\(new[indexPath.row].price)"
        homeTabCell.titleLable_1.text = "\(new[indexPath.row].title)"
        homeTabCell.ratingLabel_1.text = "\(new[indexPath.row].rating)"
        homeTabCell.descountLabel_1.text = "\(new[indexPath.row].discountPercentage)"
        homeTabCell.imageView_1.sd_setImage(with: URL(string: "\(new[indexPath.row].images)"))
        
        return homeTabCell
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
    }

extension HomeTabBar : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}

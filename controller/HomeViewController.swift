//
//  HomeViewController.swift
//  bitcode-Project-1
//
//  Created by Prince's Mac on 08/04/23.
//

import UIKit

class HomeViewController: UIViewController {

    var imgArr = ["mobile0","mobile1","mobile2","mobile3","mobile4","mobile5","mobile6"]
    var imgArr2 = ["ear-buds","ear-phones","mobile2","pendrive-img","power-bank","smart-phone","watch"]
    var titleArr2 = ["ear-buds","ear-phones","mobile2","pendrive-img","power-bank","smart-phone","watch"]
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var listProduct: UITableView!
    @IBOutlet weak var bannerIMgTable: UICollectionView!
    var currentPage = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerIMgTable.dataSource = self
        bannerIMgTable.delegate = self
        pageControl.currentPage = 0
        pageControl.numberOfPages = imgArr.count
        collectionView2.dataSource = self
        collectionView2.delegate  = self
        listProduct.dataSource = self
        listProduct.delegate = self
        

    }
   
    
    @IBAction func mobileBTN(_ sender: UIButton) {
        let HomeTabBar = storyboard?.instantiateViewController(withIdentifier: "HomeTabBar")as! HomeTabBar
        self.navigationController?.pushViewController(HomeTabBar, animated: true)
    }
    @IBAction func watchesBTN(_ sender: UIButton) {
        let HomeTabBar = storyboard?.instantiateViewController(withIdentifier: "HomeTabBar")as! HomeTabBar
        self.navigationController?.pushViewController(HomeTabBar, animated: true)
    }
    @IBAction func earphoneBTN(_ sender: UIButton) {
        let HomeTabBar = storyboard?.instantiateViewController(withIdentifier: "HomeTabBar")as! HomeTabBar
        self.navigationController?.pushViewController(HomeTabBar, animated: true)
    }
    @IBAction func powerBTN(_ sender: UIButton) {
        let HomeTabBar = storyboard?.instantiateViewController(withIdentifier: "HomeTabBar")as! HomeTabBar
        self.navigationController?.pushViewController(HomeTabBar, animated: true)
    }
    
    @IBAction func seeBTN(_ sender: UIButton) {
        let HomeTabBar = storyboard?.instantiateViewController(withIdentifier: "HomeTabBar")as! HomeTabBar
        self.navigationController?.pushViewController(HomeTabBar, animated: true)
    }
    
    
}

extension HomeViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView2 {
            imgArr2.count
        }
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let HomeCollectionViewCell = bannerIMgTable.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath)as! HomeCollectionViewCell
        HomeCollectionViewCell.ImgView.layer.borderWidth = 2
        HomeCollectionViewCell.ImgView.layer.cornerRadius = 10
        HomeCollectionViewCell.ImgView.image = UIImage(named: imgArr[indexPath.row])
        
        
        
        if collectionView == collectionView2{
             let cell3 = collectionView2.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath)as! CollectionViewCell3
            cell3.imgLBL3.layer.borderWidth = 1
            cell3.imgLBL3.image = UIImage(named:  imgArr2[indexPath.row])
            cell3.titleLBL3.text = "\(titleArr2[indexPath.row])"
            return cell3
        }
        return HomeCollectionViewCell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == bannerIMgTable {
            pageControl.currentPage = indexPath.row
        }else{
            return
        }
    }
    //MARK: - ADD GUARD CONDITION TO HANDLE APP CRASHING WHEN INTERNET IS NOT CONNECTED.
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let HomeTabBar = self.storyboard?.instantiateViewController(withIdentifier: "HomeTabBar")as! HomeTabBar
                self.navigationController?.pushViewController(HomeTabBar, animated: true)
    }
}
        
extension HomeViewController : UICollectionViewDelegate{
    
}
extension HomeViewController : UICollectionViewDelegateFlowLayout {
   
}
extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imgArr2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)as! TableViewCell
        TableViewCell.TAbleImg.image = UIImage(named:  imgArr2[indexPath.row])
        TableViewCell.tableViewTitle.text = titleArr2[indexPath.row]
        
        return TableViewCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let HomeTabBar = storyboard?.instantiateViewController(withIdentifier: "HomeTabBar")as! HomeTabBar
        self.navigationController?.pushViewController(HomeTabBar, animated: true)
    }
}
extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        listProduct.estimatedRowHeight
        200
        
    }
    
}


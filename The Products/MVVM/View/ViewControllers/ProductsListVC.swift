//
//  ProductsListVC.swift
//  The Products
//
//  Created by Padmaja Pathada on 5/12/23.
//

import Foundation
import UIKit

class ProductsListVC: UIViewController {
    
    let productVM: ProductsListVM
        
    let navTitleLabel: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Products"
        label.textColor = Constants.appTextColor
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let tableView: UITableView = {
       var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        return tableView
    }()
    
    init(productVM: ProductsListVM) {
        self.productVM = productVM
        super.init(nibName: nil, bundle: nil)
        setupUIComponents()
        updateDelegates()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        productVM.resetProductsList()
        productVM.getProductsList()
    }
    func updateDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        productVM.delegate = self
    }
    func setupUIComponents() {
        view.backgroundColor = Constants.appBGColor
        view.addSubview(navTitleLabel)
        NSLayoutConstraint.activate([
            navTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            navTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            navTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            navTitleLabel.heightAnchor.constraint(equalToConstant: 50)

        ])
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: navTitleLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)

        ])
        tableView.register(ProductsListTVCell.self, forCellReuseIdentifier: String(describing: ProductsListTVCell.self))
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension ProductsListVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productVM.productsList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductsListTVCell.self), for: indexPath) as? ProductsListTVCell else {
            return UITableViewCell()
        }
        let productInfo = productVM.productsList[indexPath.row]
        cell.productTitleLabel.text = productInfo.title
        cell.productImage.setImage(urlString: productInfo.thumbnail ?? "")
        
        cell.backgroundColor = Constants.appBGColor
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
extension ProductsListVC: BehaviourProtocol {
    func success() {
        tableView.reloadData()
    }
    
    func failure() {

    }
}
extension ProductsListVC {
    static func navigateToProductsListPage(service: ProductListServiceProtocol = ProductListService()) -> ProductsListVC {
        let viewModel = ProductsListVM(service: service)
        let vc = ProductsListVC(productVM: viewModel)
        return vc
    }
}

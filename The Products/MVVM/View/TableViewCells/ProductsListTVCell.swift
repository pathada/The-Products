//
//  ProductsListTVCell.swift
//  The Products
//
//  Created by Padmaja Pathada on 5/12/23.
//

import UIKit

class ProductsListTVCell: UITableViewCell {

    let productTitleLabel: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Items"
        label.textColor = Constants.appTextColor
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    let productImage: UIImageView = {
       var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "placeholder")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    let separatorView: UIView = {
       var vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.backgroundColor = Constants.appTextColor
        return vw
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUIComponent()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupUIComponent() {
        contentView.backgroundColor = .clear
        
        contentView.addSubview(separatorView)
        NSLayoutConstraint.activate([
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),

        ])
        
        contentView.addSubview(productImage)
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            productImage.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -10),
            productImage.widthAnchor.constraint(equalToConstant: 150)

        ])
        
        contentView.addSubview(productTitleLabel)
        NSLayoutConstraint.activate([
            productTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            productTitleLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 10),
            productTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            productTitleLabel.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -10)

        ])
    }

    
}

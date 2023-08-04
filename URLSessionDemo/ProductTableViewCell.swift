//
//  ProductTableViewCell.swift
//  URLSessionDemo
//
//  Created by Kumaran on 11/07/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBGView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var productCostLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupCell() {
        cellBGView.addShadow(shadowColor: .gray, offSet: .zero, opacity: 0, shadowRadius: 2, cornerRadius: 10, corners: .allCorners)
    }
    
    func configureCell(product: Product?) {
        productImageView.image = UIImage(named: product?.images?.first ?? "product?.price")
        productNameLabel.text = product?.title
        productCostLabel.text = "\(product?.price ?? 0)"
        productCategoryLabel.text = product?.category
    }
}

extension UIView {
        
        func addShadow(shadowColor: UIColor, offSet: CGSize, opacity: Float, shadowRadius: CGFloat, cornerRadius: CGFloat, corners: UIRectCorner, fillColor: UIColor = .white) {
            
            let shadowLayer = CAShapeLayer()
            let size = CGSize(width: cornerRadius, height: cornerRadius)
            let cgPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size).cgPath //1
            shadowLayer.path = cgPath //2
            shadowLayer.fillColor = fillColor.cgColor //3
            shadowLayer.shadowColor = shadowColor.cgColor //4
            shadowLayer.shadowPath = cgPath
            shadowLayer.shadowOffset = offSet //5
            shadowLayer.shadowOpacity = opacity
            shadowLayer.shadowRadius = shadowRadius
            self.layer.addSublayer(shadowLayer)
        }
    }

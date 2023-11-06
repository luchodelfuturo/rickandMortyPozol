//
//  ItemHomeMenuCell.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 22/09/2023.
//

import UIKit

final class ItemHomeMenuCell: UICollectionViewCell {
    
    // MARK: - Public Properties
    

    
    // MARK: - Private Properties
    private let mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        view.layer.cornerRadius = ViewValues.defaultCornerRadius
        view.layer.masksToBounds = true // esto recorta la imagen para q se agrege el rounded
        return view
    }()
    
    private let categoryMenuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Images.defaultImage)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleCategoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implementd")
    }
    
    // MARK: - Helpers
    
    private func configUI(){
        addSubview(mainContainer)
        mainContainer.fillSuperView(widthPadding: ViewValues.normalPadding)
        
        mainContainer.addSubview(categoryMenuImageView)
        categoryMenuImageView.fillSuperView()
       
        configGradientForTitle() // lo llamamos acá para que pueda estar destras del titulo
        
        mainContainer.addSubview(titleCategoryLabel)
        titleCategoryLabel.setConstraint( right: mainContainer.trailingAnchor, bottom: mainContainer.bottomAnchor, left: mainContainer.leadingAnchor, pRight: ViewValues.normalPadding, pBottom: ViewValues.normalPadding, pLeft: ViewValues.normalPadding)
        
    }
    
    private func configGradientForTitle(){
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = self.bounds //que ocupe todo el recuadro
        gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.darkGray.cgColor] //los dos colores a usar
        gradientMaskLayer.locations = [ViewValues.gradientTitleInit,ViewValues.gradientTitleEnd] //Seteamos la ubicacion desde donde a donde
        mainContainer.layer.addSublayer(gradientMaskLayer)
    }
    // MARK: - Actions
    
    @objc private func accionBoton() {
        // Código a ejecutar cuando se presiona un botón
    }
    
    func configData(viewModel: ItemHomeMenuViewModel) {
        titleCategoryLabel.text = viewModel.title
        categoryMenuImageView.image = UIImage(named: viewModel.imageName)
    }
    
}

extension ItemHomeMenuCell: Reusable { }

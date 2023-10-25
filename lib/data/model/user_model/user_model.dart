class UserModel {
	String? imageUrl;
	String? name;
	String? homeAddress;
	String? businessAddress;
	String? shoppingCenter;

	UserModel({
		this.imageUrl, 
		this.name, 
		this.homeAddress, 
		this.businessAddress, 
		this.shoppingCenter, 
	});

	factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
				imageUrl: json['image_url'] as String?,
				name: json['name'] as String?,
				homeAddress: json['home_address'] as String?,
				businessAddress: json['business_address'] as String?,
				shoppingCenter: json['shopping_center'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'image_url': imageUrl,
				'name': name,
				'home_address': homeAddress,
				'business_address': businessAddress,
				'shopping_center': shoppingCenter,
			};
}


#User
User.create(username: 'Blakeezy', password: '12345', admin: true, first_name: 'Blake', last_name: 'McDeezy', email: 'blakemcd@gmail.com', phone: '0491 570 159', dob: 19880219)
User.create(username: 'Peteezy', password: '12345', admin: false, first_name: 'Peter', last_name: 'Parker', email: 'peterparker@gmail.com', phone: '0491 570 156', dob: 20010810)
User.create(username: 'Toneezy', password: '12345', admin: false, first_name: 'Tony', last_name: 'Stark', email: 'tonystark@yahoo.com', phone: '0491 570 006', dob: 19700529)
User.create(username: 'Steveezy', password: '12345', admin: false, first_name: 'Steve', last_name: 'Rogers', email: 'steverogers@hotmail.com', phone: '0491 570 313', dob: 19180604)

#Store
Store.create(name: 'Pact', description: 'Patagonia, one of the earliest defenders of environmental ethics in the industry, was also one of the first to use recycled materials and switch to organic cotton.')
Store.create(name: 'Patagonia', description: 'Pact is pretty obsessed with making super-soft clothes that also make the world a better place.')
Store.create(name: 'Kotn', description: 'From its farms to its factories, Kotn creates all of its garments in a fair and safe environment, and is even helping suppliers make the switch to organic within the next five years.')

#Item
s1 = Store.find_by id:1
s2 = Store.find_by id:2
s3 = Store.find_by id:3

    # sub_category: jeans
    new_item1s1ijeans = s1.items.build(name: 'earthy blue jeans', category: 'clothes', sub_category: 'jeans', stock: 4, price_cents: 3654, description: 'earthy ', size: 'S', gender: 'M', img_url: 'https://connor.imgix.net/Connor/Products/C18DE105_DEN_1.png')
    new_item1s1ijeans.save
    new_item1s2ijeans = s1.items.build(name: 'earthy blue jeans', category: 'clothes', sub_category: 'jeans', stock: 6, price_cents: 5678, description:'earthy ', size: 'M', gender: 'F', img_url: 'https://image.made-in-china.com/2f0j00GFwQfiAagsgY/OEM-Brand-Light-Blue-Damaged-Distressed-Skinny-Denim-Jeans-Women.jpg')
    new_item1s2ijeans.save
    new_item1s3ijeans = s1.items.build(name: 'earthy blue jeans', category: 'clothes', sub_category: 'jeans', stock: 6, price_cents: 5567, description:'blue jeans', size: 'L', gender: 'M', img_url: 'https://connor.imgix.net/Connor/Products/C18DE105_DEN_1.png')
    new_item1s3ijeans.save

    new_item2s1ijeans = s2.items.build(name: 'dirty blue jeans', category: 'clothes', sub_category: 'jeans', stock: 4, price_cents: 5675, description: 'blue jeans', size: 'S', gender: 'F', img_url: 'https://image.made-in-china.com/2f0j00GFwQfiAagsgY/OEM-Brand-Light-Blue-Damaged-Distressed-Skinny-Denim-Jeans-Women.jpg')
    new_item2s1ijeans.save
    new_item2s2ijeans = s2.items.build(name: 'dirty blue jeans', category: 'clothes', sub_category: 'jeans', stock: 6, price_cents: 5776, description:'blue jeans', size: 'M', gender: 'F', img_url: 'https://image.made-in-china.com/2f0j00GFwQfiAagsgY/OEM-Brand-Light-Blue-Damaged-Distressed-Skinny-Denim-Jeans-Women.jpg')
    new_item2s2ijeans.save
    new_item2s3ijeans = s2.items.build(name: 'dirty blue jeans', category: 'clothes', sub_category: 'jeans', stock: 6, price_cents: 4567, description:'blue jeans', size: 'L', gender: 'M', img_url: 'https://connor.imgix.net/Connor/Products/C18DE105_DEN_1.png')
    new_item2s3ijeans.save

    new_item3s1ijeans = s3.items.build(name: 'rugged blue jeans', category: 'clothes', sub_category: 'jeans', stock: 4, price_cents: 5476, description: 'blue jeans', size: 'S', gender: 'M', img_url: 'https://connor.imgix.net/Connor/Products/C18DE105_DEN_1.png')
    new_item3s1ijeans.save
    new_item3s2ijeans = s3.items.build(name: 'rugged blue jeans', category: 'clothes', sub_category: 'jeans', stock: 6, price_cents: 6747, description:'blue jeans', size: 'M', gender: 'M', img_url: 'https://connor.imgix.net/Connor/Products/C18DE105_DEN_1.png')
    new_item3s2ijeans.save
    new_item3s3ijeans = s3.items.build(name: 'rugged blue jeans', category: 'clothes', sub_category: 'jeans', stock: 6, price_cents: 3456, description:'blue jeans', size: 'L', gender: 'F', img_url: 'https://image.made-in-china.com/2f0j00GFwQfiAagsgY/OEM-Brand-Light-Blue-Damaged-Distressed-Skinny-Denim-Jeans-Women.jpg')
    new_item3s3ijeans.save
    
    # #sub_category: shirt
    new_item1s1ishirt = s1.items.build(name: 'great fancy tshirt', category: 'clothes', sub_category: 'shirt', stock: 4, price_cents: 6987, description:'green shirt', size: 'S', gender: 'F', img_url: 'https://www.painfulclothing.com/784-thickbox_default/hate-woman-tee.jpg')
    new_item1s1ishirt.save
    new_item1s2ishirt = s1.items.build(name: 'great fancy tshirt', category: 'clothes', sub_category: 'shirt', stock: 4, price_cents: 6897, description:'green tshirt', size: 'M', gender: 'F', img_url: 'https://www.painfulclothing.com/784-thickbox_default/hate-woman-tee.jpg')
    new_item1s2ishirt.save
    new_item1s3ishirt = s1.items.build(name: 'great fancy tshirt', category: 'clothes', sub_category: 'shirt', stock: 4, price_cents: 3566, description:'green tshirt', size: 'L', gender: 'M', img_url: 'https://cdn.shopify.com/s/files/1/1779/6353/products/tallest-man-on-earth-guitar-tshirt-black-front_1024x1024.png?v=1494317466')
    new_item1s3ishirt.save

    new_item2s1ishirt = s2.items.build(name: 'funky tshirt', category: 'clothes', sub_category: 'shirt', stock: 4, price_cents: 5678, description:'green tshirt', size: 'S', gender: 'F', img_url: 'https://www.painfulclothing.com/784-thickbox_default/hate-woman-tee.jpg')
    new_item2s1ishirt.save
    new_item2s2ishirt = s2.items.build(name: 'funky tshirt', category: 'clothes', sub_category: 'shirt', stock: 4, price_cents: 5564, description:'green tshirt', size: 'M', gender: 'M', img_url: 'https://cdn.shopify.com/s/files/1/1779/6353/products/tallest-man-on-earth-guitar-tshirt-black-front_1024x1024.png?v=1494317466')
    new_item2s2ishirt.save
    new_item2s3ishirt = s2.items.build(name: 'funky tshirt', category: 'clothes', sub_category: 'shirt', stock: 4, price_cents: 3565, description:'green tshirt', size: 'L', gender: 'F', img_url: 'https://www.painfulclothing.com/784-thickbox_default/hate-woman-tee.jpg')
    new_item2s3ishirt.save

    new_item3s1ishirt = s3.items.build(name: 'swanky tshirt', category: 'clothes', sub_category: 'shirt', stock: 4, price_cents: 3566, description:'green tshirt', size: 'S', gender: 'M', img_url: 'https://cdn.shopify.com/s/files/1/1779/6353/products/tallest-man-on-earth-guitar-tshirt-black-front_1024x1024.png?v=1494317466')
    new_item3s1ishirt.save
    new_item3s2ishirt = s3.items.build(name: 'swanky tshirt', category: 'clothes', sub_category: 'shirt', stock: 4, price_cents: 5366, description:'green tshirt', size: 'M', gender: 'F', img_url: 'https://www.painfulclothing.com/784-thickbox_default/hate-woman-tee.jpg')
    new_item3s2ishirt.save
    new_item3s3ishirt = s3.items.build(name: 'swanky tshirt', category: 'clothes', sub_category: 'shirt', stock: 4, price_cents: 3455, description:'green tshirt', size: 'L', gender: 'M', img_url: 'https://cdn.shopify.com/s/files/1/1779/6353/products/tallest-man-on-earth-guitar-tshirt-black-front_1024x1024.png?v=1494317466')
    new_item3s3ishirt.save

    # # #sub_category: jacket
    new_item1s1ijacket = s1.items.build(name: 'leather jacket', category: 'clothes', sub_category: 'jacket', stock: 4, price_cents: 8576, description:'suede jacket', size: 'S', gender: 'F', img_url: 'https://www.distressedjackets.com/image/cache//catalog/2020/oko-1000x1000.PNG')
    new_item1s1ijacket.save
    new_item1s2ijacket = s1.items.build(name: 'leather jacket', category: 'clothes', sub_category: 'jacket', stock: 4, price_cents: 4567, description:'suede jacket', size: 'M', gender: 'F', img_url: 'https://www.distressedjackets.com/image/cache//catalog/2020/oko-1000x1000.PNG')
    new_item1s2ijacket.save
    new_item1s3ijacket = s1.items.build(name: 'leather jacket', category: 'clothes', sub_category: 'jacket', stock: 6, price_cents: 4767, description:'suede jacket', size: 'L', gender: 'M', img_url: 'https://ae01.alicdn.com/kf/Hbe699bdd0f904814aefeb078d00f54eeq/PU-Leather-Jacket-Men-Winter-Casual-Stand-Jackets-Man-Motorcycle-Vintage-Leather-Mens-Jacket-Coat-Chaqueta.jpg')
    new_item1s3ijacket.save

    new_item2s1ijacket = s2.items.build(name: 'faux leather jacket', category: 'clothes', sub_category: 'jacket', stock: 4, price_cents: 4657, description:'suede jacket', size: 'S', gender: 'M', img_url: 'https://ae01.alicdn.com/kf/Hbe699bdd0f904814aefeb078d00f54eeq/PU-Leather-Jacket-Men-Winter-Casual-Stand-Jackets-Man-Motorcycle-Vintage-Leather-Mens-Jacket-Coat-Chaqueta.jpg')
    new_item2s1ijacket.save
    new_item2s2ijacket = s2.items.build(name: 'faux leather jacket', category: 'clothes', sub_category: 'jacket', stock: 4, price_cents: 7465, description:'suede jacket', size: 'M', gender: 'F', img_url: 'https://www.distressedjackets.com/image/cache//catalog/2020/oko-1000x1000.PNG')
    new_item2s2ijacket.save
    new_item2s3ijacket = s2.items.build(name: 'faux leather jacket', category: 'clothes', sub_category: 'jacket', stock: 6, price_cents: 5346, description:'suede jacket', size: 'L', gender: 'F', img_url: 'https://www.distressedjackets.com/image/cache//catalog/2020/oko-1000x1000.PNG')
    new_item2s3ijacket.save

    new_item3s1ijacket = s3.items.build(name: 'trendy leather jacket', category: 'clothes', sub_category: 'jacket', stock: 4, price_cents: 2345, description:'suede jacket', size: 'S', gender: 'F', img_url: 'https://www.distressedjackets.com/image/cache//catalog/2020/oko-1000x1000.PNG')
    new_item3s1ijacket.save
    new_item3s2ijacket = s3.items.build(name: 'trendy leather jacket', category: 'clothes', sub_category: 'jacket', stock: 4, price_cents: 6578, description:'suede jacket', size: 'M', gender: 'M', img_url: 'https://ae01.alicdn.com/kf/Hbe699bdd0f904814aefeb078d00f54eeq/PU-Leather-Jacket-Men-Winter-Casual-Stand-Jackets-Man-Motorcycle-Vintage-Leather-Mens-Jacket-Coat-Chaqueta.jpg')
    new_item3s2ijacket.save
    new_item3s3ijacket = s3.items.build(name: 'trendy leather jacket', category: 'clothes', sub_category: 'jacket', stock: 6, price_cents: 4765, description:'suede jacket', size: 'L', gender: 'F', img_url: 'https://www.distressedjackets.com/image/cache//catalog/2020/oko-1000x1000.PNG')
    new_item3s3ijacket.save

#Address
u1 = User.find_by id:1
u2 = User.find_by id:2
u3 = User.find_by id:3
u4 = User.find_by id:4

address_one = u1.build_address(street_address:'253 Franklin Street', city: 'Melbourne', state: 'VIC', postcode: 3000, address_type: 'home')
address_one.save

address_two = u2.build_address(street_address:'26 Martens Place', city: 'Tingalpa', state: 'QLD', postcode: 4173, address_type: 'home')
address_two.save

address_three = u3.build_address(street_address:'57 Bayview Close', city: 'Tieri', state: 'QLD', postcode: 4709, address_type: 'home')
address_three.save

address_four = u4.build_address(street_address:'35 Raglan Street', city: 'Tingoora', state: 'VIC', postcode: 3507, address_type: 'home')
address_four.save
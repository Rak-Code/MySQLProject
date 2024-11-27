


 MySQL Project Documentation

To properly show the relationships between the tables, here's how you can visualize the database schema, describing how the tables are connected via foreign keys. The relationships between the tables can be grouped based on their interdependencies, and I'll also include explanations for each relationship.

 Database Schema Relationships

---

 1. Users
   - user_id (PK): Unique identifier for each user.
   - username: User's username.
   - email: User's email.
   - password: User's hashed password.
   - phone: User's phone number.
   - address: User's address.

---

 2. Products
   - product_id (PK): Unique identifier for each product.
   - product_name: Name of the product.
   - description: Description of the product.
   - price: Price of the product.
   - stock_quantity: Quantity available in stock.
   - category_id (FK): Foreign key referencing `Categories(category_id)`.
   - brand: Brand name.

---

 3. Categories
   - category_id (PK): Unique identifier for each category.
   - category_name: Name of the category.

   Relationship: 
   - The `Products` table has a foreign key (`category_id`) that references `Categories(category_id)`.

---

 4. Orders
   - order_id (PK): Unique identifier for each order.
   - user_id (FK): Foreign key referencing `Users(user_id)`.
   - order_date: Date and time of the order.
   - status: Order status (e.g., Pending, Completed, Cancelled).
   - total_amount: Total cost of the order.

   Relationship: 
   - The `Orders` table is connected to the `Users` table via the foreign key `user_id`.

---

 5. Order_Items
   - order_item_id (PK): Unique identifier for each order item.
   - order_id (FK): Foreign key referencing `Orders(order_id)`.
   - product_id (FK): Foreign key referencing `Products(product_id)`.
   - quantity: Quantity of the product ordered.
   - price: Price of the product at the time of the order.

   Relationships:
   - `Order_Items` references `Orders(order_id)` through `order_id`.
   - `Order_Items` references `Products(product_id)` through `product_id`.

---

 6. Cart
   - cart_id (PK): Unique identifier for each cart.
   - user_id (FK): Foreign key referencing `Users(user_id)`.

   Relationship:
   - The `Cart` table is linked to `Users(user_id)` through the foreign key `user_id`.

---

 7. Cart_Items
   - cart_item_id (PK): Unique identifier for each cart item.
   - cart_id (FK): Foreign key referencing `Cart(cart_id)`.
   - product_id (FK): Foreign key referencing `Products(product_id)`.
   - quantity: Quantity of the product in the cart.

   Relationships:
   - `Cart_Items` references `Cart(cart_id)` through `cart_id`.
   - `Cart_Items` references `Products(product_id)` through `product_id`.

---

 8. Reviews
   - review_id (PK): Unique identifier for each review.
   - user_id (FK): Foreign key referencing `Users(user_id)`.
   - product_id (FK): Foreign key referencing `Products(product_id)`.
   - rating: Rating given by the user (1-5).
   - comment: User's comment.

   Relationships:
   - `Reviews` is connected to `Users(user_id)` via the foreign key `user_id`.
   - `Reviews` is also connected to `Products(product_id)` via the foreign key `product_id`.

---

 9. Payments
   - payment_id (PK): Unique identifier for each payment.
   - order_id (FK): Foreign key referencing `Orders(order_id)`.
   - payment_date: Date of payment.
   - amount: Payment amount.
   - payment_method: Method used for payment (e.g., Credit Card, PayPal).
   - payment_status: Status of the payment (e.g., Successful, Failed, Pending).

   Relationship:
   - The `Payments` table is connected to `Orders(order_id)` through the foreign key `order_id`.

---

 10. Wishlist
   - wishlist_id (PK): Unique identifier for each wishlist.
   - user_id (FK): Foreign key referencing `Users(user_id)`.

   Relationship:
   - The `Wishlist` table references `Users(user_id)` through the foreign key `user_id`.

---

 11. Wishlist_Items
   - wishlist_item_id (PK): Unique identifier for each wishlist item.
   - wishlist_id (FK): Foreign key referencing `Wishlist(wishlist_id)`.
   - product_id (FK): Foreign key referencing `Products(product_id)`.

   Relationships:
   - `Wishlist_Items` references `Wishlist(wishlist_id)` through the foreign key `wishlist_id`.
   - `Wishlist_Items` references `Products(product_id)` through the foreign key `product_id`.

---
![diagram (2)](https://github.com/user-attachments/assets/24cdf7c7-4df4-49b1-bf21-0e430c309681)



 Entity Relationship Diagram (ERD)
To visualize the relationships between the tables, you can create an Entity Relationship Diagram (ERD). Below is a basic representation of the relationships:

1. Users ↔ Orders (One user can have multiple orders)
2. Users ↔ Cart (One user can have one cart)
3. Users ↔ Wishlist (One user can have one wishlist)
4. Products ↔ Order_Items (One product can appear in multiple order items)
5. Products ↔ Cart_Items (One product can appear in multiple cart items)
6. Products ↔ Reviews (One product can have multiple reviews)
7. Orders ↔ Order_Items (One order can contain multiple items)
8. Wishlist ↔ Wishlist_Items (One wishlist can contain multiple items)
9. Cart ↔ Cart_Items (One cart can contain multiple items)
10. Orders ↔ Payments (One order can have one payment)


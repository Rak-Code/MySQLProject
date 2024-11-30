

 MySQL Project Documentation

This document details the database schema, relationships, and advanced functionalities implemented for an e-commerce application. The database is designed to support core functionalities like order processing, user management, and product handling, with added features like triggers and stored procedures.

---

 Database Schema Relationships

 1. Users
- Attributes:
  - `user_id` (PK): Unique identifier for each user.

---

 2. Products
- Attributes:
  - `product_id` (PK): Unique identifier for each product.
  - `category_id` (FK): Foreign key referencing `Categories(category_id)`.

---

 3. Categories
- Attributes:
  - `category_id` (PK): Unique identifier for each category.

- Relationship:
  - `Products` references `Categories` via the foreign key `category_id`.

---

 4. Orders
- Attributes:
  - `order_id` (PK): Unique identifier for each order.
  - `user_id` (FK): Foreign key referencing `Users(user_id)`.

- Relationship:
  - Connected to `Users` via the foreign key `user_id`.

---

 5. Order_Items
- Attributes:
  - `order_item_id` (PK): Unique identifier for each order item.
  - `order_id` (FK): Foreign key referencing `Orders(order_id)`.
  - `product_id` (FK): Foreign key referencing `Products(product_id)`.

- Relationships:
  - References `Orders` via `order_id`.
  - References `Products` via `product_id`.

---

 6. Cart
- Attributes:
  - `cart_id` (PK): Unique identifier for each cart.
  - `user_id` (FK): Foreign key referencing `Users(user_id)`.

- Relationship:
  - Linked to `Users` via the foreign key `user_id`.

---

 7. Cart_Items
- Attributes:
  - `cart_item_id` (PK): Unique identifier for each cart item.
  - `cart_id` (FK): Foreign key referencing `Cart(cart_id)`.
  - `product_id` (FK): Foreign key referencing `Products(product_id)`.

- Relationships:
  - References `Cart` via `cart_id`.
  - References `Products` via `product_id`.

---

 8. Reviews
- Attributes:
  - `review_id` (PK): Unique identifier for each review.
  - `user_id` (FK): Foreign key referencing `Users(user_id)`.
  - `product_id` (FK): Foreign key referencing `Products(product_id)`.

- Relationships:
  - Connected to `Users` via the foreign key `user_id`.
  - Connected to `Products` via the foreign key `product_id`.

---

 9. Payments
- Attributes:
  - `payment_id` (PK): Unique identifier for each payment.
  - `order_id` (FK): Foreign key referencing `Orders(order_id)`.

- Relationship:
  - Connected to `Orders` via the foreign key `order_id`.

---

 10. Wishlist
- Attributes:
  - `wishlist_id` (PK): Unique identifier for each wishlist.
  - `user_id` (FK): Foreign key referencing `Users(user_id)`.

- Relationship:
  - References `Users` via the foreign key `user_id`.

---

 11. Wishlist_Items
- Attributes:
  - `wishlist_item_id` (PK): Unique identifier for each wishlist item.
  - `wishlist_id` (FK): Foreign key referencing `Wishlist(wishlist_id)`.
  - `product_id` (FK): Foreign key referencing `Products(product_id)`.

- Relationships:
  - References `Wishlist` via `wishlist_id`.
  - References `Products` via `product_id`.

---

 Advanced Features

 Views
- DetailedView:
  - Combines data from orders, users, products, and order items.
  - Displays detailed information, including calculated total prices per order item.

---

 Functions
- Discount Calculation:
  - Calculates the discounted price for a product based on the original price and discount percentage.

---

 Procedures
- Get User Details:
  - Retrieves details of a specific user by their user ID.

- Get Orders:
  - Fetches all orders placed by a specific user, including their username.

---

 Triggers
- Password Change Validation:
  - Ensures users cannot reuse their previous or recently used passwords.

- Log User Details on Order Deletion:
  - Automatically logs user details in the `user_log` table when an order is deleted.

---

![diagram (2)](https://github.com/user-attachments/assets/24cdf7c7-4df4-49b1-bf21-0e430c309681)


 Relationships Summary (ERD)
- Users ↔ Orders: One user can have multiple orders.
- Users ↔ Cart: One user can have one cart.
- Users ↔ Wishlist: One user can have one wishlist.
- Products ↔ Order_Items: One product can appear in multiple order items.
- Products ↔ Cart_Items: One product can appear in multiple cart items.
- Products ↔ Reviews: One product can have multiple reviews.
- Orders ↔ Order_Items: One order can contain multiple items.
- Wishlist ↔ Wishlist_Items: One wishlist can contain multiple items.
- Cart ↔ Cart_Items: One cart can contain multiple items.
- Orders ↔ Payments: One order can have one payment.

---

Let me know if you need further adjustments or additional features!

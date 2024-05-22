/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product;

import Product.ProductDTO;
import Product.ProductDTO;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author hd
 */
public class CartDTO {

    private Map<String, ProductDTO> cart;

    public CartDTO() {
    }

    public CartDTO(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public boolean add(ProductDTO product) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (this.cart.containsKey(product.getSKU())) {
                int currentQuantity = this.cart.get(product.getSKU()).getQuantity();
                product.setQuantity(currentQuantity + product.getQuantity());
            }
            this.cart.put(product.getSKU(), product);
            check = true;
        } catch (Exception e) {
        }

        return check;
    }

    public boolean change(String SKU, ProductDTO product) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(SKU)) {
                    this.cart.replace(SKU, product);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }
    public boolean remove(String SKU) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(SKU)) {
                    this.cart.remove(SKU);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }

}

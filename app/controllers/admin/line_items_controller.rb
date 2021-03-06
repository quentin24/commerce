class LineItemsController < ApplicationController

  def create
    @cart = current_cart
    product = Product.find(params[:product_id]);
    @line_item = @cart.add_product(product.id)

    if @line_item.save
      flash[:notice] = "Le produit a bien ete ajoute au panier"
      redirect_to [:admin, @cart]
    else
      flash[:error] = "Le produit n'a pas pu etre ajoute au panier"
      redirect [:admin, @cart]
    end

  end

  def destroy
    @line_item = LineItem.find(params[:id]).destroy
    flash[:notice] = "Le produit a bien ete supprime de votre panier"
    redirect_to admin_current_cart
  end

end

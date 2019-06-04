class VendedoresController < ApplicationController
  def index
    @vendedor=Vendedor.all
  end

  def new 
    @vendedor=Vendedor.new     
  end
  
  def create
    @vendedor=Vendedor.new(nombre: params[:vendedor][:nombre], 
    direccion: params[:vendedor][:direccion], 
    ciudad: params[:vendedor][:ciudad], 
    telefono: params[:vendedor][:telefono] ) 

if @vendedor.save   
redirect_to action: "index"
else
render :new 
end
end
def edit
@vendedor = Vendedor.find(params[:id])
render :new
end

def update
@vendedor = Vendedor.find(params[:vendedor][:id])
if @vendedor.update(
  nombre: params[:vendedor][:nombre], 
  direccion: params[:vendedor][:direccion], 
  ciudad: params[:vendedor][:ciudad], 
  telefono: params[:vendedor][:telefono]  )  
  redirect_to action: "index" 
else
  render 'edit'    
end
end    

def destroy
@vendedor = Vendedor.find(params[:id])
@vendedor.destroy
redirect_to action: "index" 
end

end
   
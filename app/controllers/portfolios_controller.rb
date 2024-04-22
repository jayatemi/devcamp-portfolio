class PortfoliosController < ApplicationController

  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]

  layout 'portfolio'

  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

	def index
		@portfolio_items = Portfolio.all
	end 

  def angular
    @angular_portfolio_items = Portfolio.angular
  end 

	def new
		@portfolio_item = Portfolio.new
    3.times {@portfolio_item.technologies.build }
	end 

    def create
      @portfolio_item = Portfolio.new(portfolio_params) #defines what the form is allowed to access

      respond_to do |format|
        if @portfolio_item.save
          format.html { redirect_to portfolios_path, notice: "Your Portfolio item is now live." }
          #format.json { render :show, status: :created, location: @blog }
        else
          format.html { render :new, status: :unprocessable_entity }
          #format.json { render json: @blog.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit 
    end 

    def update
      respond_to do |format|
        if @portfolio_item.update(portfolio_params)
          format.html { redirect_to portfolios_path, notice: "The record was successfully updated." }
          #format.json { render :show, status: :ok, location: @blog }
        else
          format.html { render :edit, status: :unprocessable_entity }
          #format.json { render json: @blog.errors, status: :unprocessable_entity }
        end
      end

    end

    def show
    end 

    def destroy

      #destroy/delete the record
      @portfolio_item.destroy!

      #redirect
      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: "Record was removed." }
        #format.json { head :no_content }
      end
  
    end
    
    private 

    def portfolio_params
      params.require(:portfolio).permit(:title,
                                        :subtitle, 
                                        :body, 
                                        technologies_attributes: [:name]) 
    end

    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end 

end

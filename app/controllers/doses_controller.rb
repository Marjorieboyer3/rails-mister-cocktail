class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose= Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
      # new_cocktail_dose_path(@cocktail)
    end

    def destroy
      @dose = Dose.find(params[:id])
      @cocktail = @dose.cocktail
      @dose.destroy
      redirect_to cocktail_path(@cocktail)

    end

  end

 private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end

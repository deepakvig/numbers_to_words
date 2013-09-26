class ConvertorController < ApplicationController

  def index
  end
  
  def create
    convert = params[:convert]
    val = CustomNumeric.new(convert[:value])
    @result = val.convert_to_words
  end

end

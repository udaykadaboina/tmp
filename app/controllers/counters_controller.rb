class CountersController < ApplicationController
  
  def index
    @counters = Counter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @counters }
    end
  end

 
  def show
    @counter = Counter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @counter }
    end
  end

  
  def new
    @counter = Counter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @counter }
    end
  end

  def edit
    @counter = Counter.find(1)
  end


  def create
    @counter = Counter.new(params[:counter])

    respond_to do |format|
      if @counter.save
        format.html { redirect_to @counter, :notice => 'Counter was successfully created.' }
        format.json { render :json => @counter, :status => :created, :location => @counter }
      else
        format.html { render :action => "new" }
        format.json { render :json => @counter.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def update
    @counter = Counter.find(1)
    if CountersController.action.name == "update_goal" 
      @counter = Counter.find(1)
      @gl = @counter.goal
      @gl = @gl + 1
      @counter.update_attributes(:goal => @gl)
    elsif CountersController.action.name == "update_foul" 
      @counter = Counter.find(1)
      @fl = @counter.foul
      @fl = @fl + 1
      @counter.update_attributes(:foul => @fl)
    end
    respond_to do |format|
      format.html { redirect_to @counter, :notice => 'Counter was successfully updated.' }
      format.json { head :ok }
    end
     
  end

  def update_goal
  end

  def update_foul
  end
  
  def destroy
    @counter = Counter.find(params[:id])
    @counter.destroy

    respond_to do |format|
      format.html { redirect_to counters_url }
      format.json { head :ok }
    end
  end

end
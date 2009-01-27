class SuggestionsController < ApplicationController
  # GET /suggestions
  # GET /suggestions.xml
  def index
    @suggestions = Suggestion.find(:all, 
                      :order => "votes DESC, name")
    @user = find_user

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @suggestions }
    end
  end

  # GET /suggestions/1
  # GET /suggestions/1.xml
  def show
    @suggestion = Suggestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @suggestion }
    end
  end

  # GET /suggestions/new
  # GET /suggestions/new.xml
  def new
    @suggestion = Suggestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @suggestion }
    end
  end

  # GET /suggestions/1/edit
  def edit
    @suggestion = Suggestion.find(params[:id])
  end

  # POST /suggestions
  # POST /suggestions.xml
  def create
    @suggestion = Suggestion.new(params[:suggestion])

    respond_to do |format|
      if @suggestion.save
        #flash[:notice] = 'Suggestion was successfully created.'
        format.html { redirect_to(root_url) } 
        format.xml  { render :xml => @suggestion, :status => :created, :location => @suggestion }
      else
        flash[:notice] = 'Thanks, but that name has already been suggested.'
        format.html { redirect_to(root_url) }
        format.xml  { render :xml => @suggestion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /suggestions/1
  # PUT /suggestions/1.xml
  def update
    @suggestion = Suggestion.find(params[:id])

    respond_to do |format|
      if @suggestion.update_attributes(params[:suggestion])
        #flash[:notice] = 'Suggestion was successfully updated.'
        format.html { redirect_to(root_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @suggestion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /suggestions/1
  # DELETE /suggestions/1.xml
  def destroy
    @suggestion = Suggestion.find(params[:id])
    @suggestion.destroy

    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.xml  { head :ok }
    end
  end

  #def modify_votes
  #  @suggestion = Suggestion.find(params[:id])
  #  @suggestion.update_attribute :votes, @suggestion.votes + params[:by].to_i 
  #  render_text @suggestion.votes
  #end
  def modify_votes_old
    # find and update the suggestion's vote count
    @suggestion = Suggestion.find(params[:id])
    @suggestion.update_attribute :votes, @suggestion.votes + params[:by].to_i 
   
    respond_to do |format|
      format.html { redirect_to(root_url) } 
      format.xml  { head :ok }
    end
  end

  def modify_votes # new
    # find and update the suggestion's vote count
    @suggestion = Suggestion.find(params[:id])
    by = params[:by].to_i
    @suggestion.update_attribute :votes, @suggestion.votes + by 

    # update user vote info in session
    @user = find_user
    oldv = @user.get_vote(@suggestion.name)
    oldv = 0 if oldv == nil
    @user.vote_on(@suggestion.name,by+oldv)
   
    respond_to do |format|
      format.html { redirect_to(root_url) } 
      format.xml  { head :ok }
    end
  end

  private
    def find_user
      unless session[:user]
        session[:user] = User.new
      end
      session[:user]
    end

end

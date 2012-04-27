class WaitingListsController < ApplicationController
  # GET /waiting_lists
  # GET /waiting_lists.json
  def index
    @waiting_lists = WaitingList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @waiting_lists }
    end
  end

  # GET /waiting_lists/1
  # GET /waiting_lists/1.json
  def show
    @waiting_list = WaitingList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @waiting_list }
    end
  end

  # GET /waiting_lists/new
  # GET /waiting_lists/new.json
  def new
    @waiting_list = WaitingList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @waiting_list }
    end
  end

  # GET /waiting_lists/1/edit
  def edit
    @waiting_list = WaitingList.find(params[:id])
  end

  # POST /waiting_lists
  # POST /waiting_lists.json
  def create
    @waiting_list = WaitingList.new(params[:waiting_list])

    respond_to do |format|
      if @waiting_list.save
        UserMailer.add_to_waitlist(@waiting_list).deliver
        format.html { render action: "index", notice: 'Waiting list was successfully created.' }
        format.json { render json: @waiting_list, status: :created, location: @waiting_list }
      else
        format.html { render action: "new" }
        format.json { render json: @waiting_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /waiting_lists/1
  # PUT /waiting_lists/1.json
  def update
    @waiting_list = WaitingList.find(params[:id])

    respond_to do |format|
      if @waiting_list.update_attributes(params[:waiting_list])
        format.html { redirect_to @waiting_list, notice: 'Waiting list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @waiting_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waiting_lists/1
  # DELETE /waiting_lists/1.json
  def destroy
    @waiting_list = WaitingList.find(params[:id])
    @waiting_list.destroy

    respond_to do |format|
      format.html { redirect_to waiting_lists_url }
      format.json { head :no_content }
    end
  end
end

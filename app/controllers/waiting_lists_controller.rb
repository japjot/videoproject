class WaitingListsController < ApplicationController
  # GET /waiting_lists
  # GET /waiting_lists.json
  def index
    @waiting_lists = WaitingList.find_all_by_email_sent(false)

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
        format.html { redirect_to @waiting_list, notice: 'Waiting list was successfully created.' }
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
    UserMailer.add_to_beta(@waiting_list).deliver
    @waiting_list.set_email_sent_at_to_now
    @waiting_list.set_email_sent_to_true

    respond_to do |format|
      if @waiting_list.save
        format.html { redirect_to waiting_lists_path, notice: 'Successfully sent the last email.  ' }
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

class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /groups/1
  # GET /groups/1.json
  def show
    @users = @group.users
    @events = []
    for user in @users
      @events.concat(user.events)
    end
  end

  # GET /groups/new
  def new
    @group = Group.new
    @friends = User.find(current_user.id).friends.joins(:friendships).where(friendships: {confirmed: 1}).distinct
    # @friends = User.find(current_user.id).friends.joins(:friendships).where(friendships: {confirmed: 1}).concat(User.find(current_user.id).inverted_friends.joins(:inverted_friendships).where(inverted_friendships: {confirmed: 1}))
    @groupmembers = @group.users
  end

  # GET /groups/1/edit
  def edit
    @friends = User.find(current_user.id).friends.joins(:friendships).where(friendships: {confirmed: 1}).distinct.where.not(id: @group.users)
    @groupmembers = @group.users
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(title: params[:group][:title], description: params[:group][:description])
    @members = params[:group][:members]

    @group.add(current_user)
    for member in @members
      if (member != "")
        @group.add(User.where(:username => member).first)
      end
    end

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end



  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(title: params[:group][:title], description: params[:group][:description])

        @group.users.delete(User.all)

        @members = params[:group][:members]
        for member in @members
          if (member != "")
            @group.add(User.where(:username => member).first)
          end
        end

        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }

      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }

      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      #params.require(:group, :title, :description, :members)
    end
end

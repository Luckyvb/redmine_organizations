   class OrganizationsController < ApplicationController
     unloadable

     before_action :find_organization, :except => [:new, :create, :index]

     #before_action :authorize

     def index
       @organizations = Organization.accessible.all || []
     end

     def new
       @organization = Organization.new
     end

     def create
       @organization = Organization.new()
       @organization.attributes = params[:organization]
       if @organization.save
         flash[:notice] = t('organization.action.new.success')
         redirect_to :controller => 'organizations', :action => 'index'
       else
         render :action => 'new'
       end
     end

     def edit
     end

     def update
       @organization.attributes = params[:organization]
       if @organization.save
         flash[:notice] = t('organization.action.edit.success')
         redirect_to :controller => 'organizations', :action => 'index'
       else
         render :action => 'edit'
       end
     end

     def show
     end

     def destroy
       @organization.destroy
       flash[:notice] = t('organization.action.delete.success')
       redirect_to :controller => 'organizations', :action => 'index'
     end

     private

     def find_organization
       @organization = Organization.accessible.find(params[:id])
     rescue ActiveRecord::RecordNotFound
       render_404
     end

   end

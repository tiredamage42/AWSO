ActiveAdmin.register Author do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :password
    column :created_at
    column :superadmin, :label => "Super Administrator"
      
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :password
  filter :superadmin


  #form do |f|
  #  f.inputs "User Details" do
  #    f.input :email
  #    f.input :password
  #    f.input :password_confirmation
  #    f.input :superadmin, :label => "Super Administrator"
  #  end
  #  f.buttons
  #end
  
  create_or_edit = Proc.new {
    @author            = Author.find_or_create_by_id(params[:id])
    @author.superadmin = params[:author][:superadmin]
    @author.attributes = params[:author].delete_if do |k, v|
      (k == "superadmin") ||
      (["password", "password_confirmation"].include?(k) && v.empty? && !@author.new_record?)
    end
    if @author.save
      redirect_to :action => :show, :id => @author.id
    else
      render active_admin_template((@author.new_record? ? 'new' : 'edit') + '.html.erb')
    end
  }
  member_action :create, :method => :post, &create_or_edit
  member_action :update, :method => :put, &create_or_edit

end
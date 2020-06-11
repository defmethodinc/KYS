ActiveAdmin.register Experience do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :member_id, :tool_id, :client_id, :experience_in_days
  #
  # or
  #
  # permit_params do
  #   permitted = [:member_id, :tool_id, :client_id, :experience_in_days]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

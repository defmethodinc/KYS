ActiveAdmin.register ConfidenceLevel do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :member_id, :tool_id, :confidence_level
  #
  # or
  #
  # permit_params do
  #   permitted = [:member_id, :tool_id, :confidence_level]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

ActiveAdmin.register MemoExample do
  permit_params :id, :content, :remark
  config.sort_order = "position_asc"
end

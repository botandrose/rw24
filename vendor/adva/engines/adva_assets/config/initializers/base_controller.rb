ActionDispatch::Callbacks.to_prepare do
  Admin::BaseController.class_eval { helper :'admin/assets' }
end

module DashboardHelper
  def label_class_for(role)
    {
      :admin => 'label-danger',
      :user => 'label-primary',
      :customer => 'label-warning',
      :editor => 'label-success'
    }[role.to_sym] || role.to_s
  end
end

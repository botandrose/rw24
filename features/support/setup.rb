Before do
  @site = FactoryBot.create :site, :id => 1

  @admin = FactoryBot.create :user, :email => "admin@riverwest24.com"
  @admin.roles << Rbac::Role.new( :name => "superuser" )
  @site.users << @admin

  @home = FactoryBot.create :page, :site => @site, :title => "Home"
  FactoryBot.create :article, section: @home, title: "Home", body: "Wecome to RW24", author: @admin
end

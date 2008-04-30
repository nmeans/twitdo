# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def copyright_string
    year = Time.now.strftime("%Y")
    "Copyright &copy; #{year == "2008" ? "2008" : "2008-#{year}"}"
  end
end

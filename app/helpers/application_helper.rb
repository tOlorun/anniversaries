module ApplicationHelper
  
  def error_messages_for( object )
    render(:partial => 'shared/error_messages', :locals => {:object => object})
  end

  def title
  	app_name = "Fasyl Anniversaries ... Fasyl Group ... NG"
  	if @page_title
  		title = "#{@page_title} :: #{app_name}"
  	else
  		title = app_name
  	end
  end

end
